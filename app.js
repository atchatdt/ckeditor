const express = require('express');
const bodyParser = require('body-parser');
var multer  =   require('multer');
var fs = require('fs')
var path = require('path')
var crypto = require('crypto');

    const {
        Pool,
        Client
    } = require('pg')
    const connectionString = 'postgres://postgres:123@localhost:5432/editor'

    const client = new Client({
        connectionString
    })

    client.connect();

const app = express();

app.use(bodyParser.urlencoded({ extended: false }))
 
// parse application/json
app.use(bodyParser.json())

app.set('view engine', 'ejs');
app.set('views', './views');



const storage = multer.diskStorage({
  destination: "public/uploads",
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  }
});
const upload = multer({
  storage,
  limits: { fileSize: 1000000 }, // giới hạn dung lượng file tải lên
  fileFilter: function(req, file, cb) {
    checkFileType(file, cb);
  }
}).single("file");

const uploads = multer({
  storage,
  limits: { fileSize: 1000000 },
  fileFilter: function(req, file, cb) {
    checkFileType(file, cb);
  }
}).array("files");
function checkFileType(file, cb) {
  // Allowed ext
  const filetypes = /jpeg|jpg|png|gif/;
  // Check ext
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  // Check mime
  const mimetype = filetypes.test(file.mimetype);

  if (mimetype && extname) {
    return cb(null, true);
  } else {
    cb("Error: Images Only!");
  }
}

app.use('/public', express.static('public'));
app.use(express.static(__dirname + '/public'));



app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
    extended: false,
  }));
  
var PORT = process.env.PORT || 8080
app.get('/', (req,res) =>{
    res.render('index')
})
app.post('/post', async (req,res) => {
  let content = req.body.editor

  // res.json(content)

  let query =  `INSERT INTO saveposts VALUES  ('${content}')`
  await client.query(query).then(data => data).catch(err => err)
  // res.render('content',{
  //   content
  // })
  res.send('Save ok')
})

app.get('/detail-post/:id',async(req,res) =>{
  let id = parseInt(req.params.id)
  let query = `SELECT content FROM saveposts WHERE id = ${id}`
  let content = await client.query(query)
                            .then(data => data.rows)
                            .catch(err => err)
  // console.log(content)
  res.render('content',{
    content: content[0].content
  })
})

app.get('/edit/:id', async(req,res) =>{
  let id = parseInt(req.params.id)
  let query = `SELECT content FROM saveposts WHERE id = ${id}`
  let content = await client.query(query)
                            .then(data => data.rows)
                            .catch(err => err)
  content = content[0].content
  res.render('edit',{content,id})
})

app.post('/save-post/:id', async (req,res) => {
  let id = parseInt(req.params.id)
  let content = req.body.editor
  // console.log(content)
  let query = `UPDATE saveposts SET content = '${content}' WHERE id = ${id}`;
  await client.query(query).then(data => data).catch(err => err)

  res.redirect(`/detail-post/${id}`)
})

app.get('/files', function (req, res) {
  const images = fs.readdirSync('public/uploads')
  var sorted = []
  for (let item of images){
      if(item.split('.').pop() === 'png'
      || item.split('.').pop() === 'jpg'
      || item.split('.').pop() === 'jpeg'
      || item.split('.').pop() === 'svg'){
          var abc = {
                "image" : "/uploads/"+item,
                "folder" : '/'
          }
          sorted.push(abc)
      }
  }
  res.send(sorted);
})

//Multiple
app.post("/uploads", (req, res, next) => {
  uploads(req, res, err => {
    if (err) {
      console.log({err})
      res.redirect('back')
    } else {
      res.redirect('back')    }
  });
});


app.post('/delete_file', function(req, res, next){
  var url_del = 'public' + req.body.url_del
  if(fs.existsSync(url_del)){
    fs.unlinkSync(url_del)
  }
  res.redirect('back')
});

app.use(function (req, res) {

  res.status(404)
  res.send('404 not found');
});

app.listen(PORT, () => console.log(`OK ${PORT}`))