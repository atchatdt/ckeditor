PGDMP     :    5                 x            editor    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    33234    editor    DATABASE     �   CREATE DATABASE editor WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE editor;
                postgres    false            �            1259    33235 	   saveposts    TABLE     Y   CREATE TABLE public.saveposts (
    content character varying,
    id bigint NOT NULL
);
    DROP TABLE public.saveposts;
       public         heap    postgres    false            �            1259    33241    saveposts_id_seq    SEQUENCE     �   ALTER TABLE public.saveposts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.saveposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �
          0    33235 	   saveposts 
   TABLE DATA           0   COPY public.saveposts (content, id) FROM stdin;
    public          postgres    false    202   @                  0    0    saveposts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.saveposts_id_seq', 9, true);
          public          postgres    false    203            �
   �  x��Y�k�>K��,	�g$۲c�������C.�P�]�]��ު�&�ŇB K�C9,�1�,�Ys؋��1�I�W��ӒeE"��A�d����}�{?����������rl�4I'��?*���3�q��n��OԌTr�K��o�v=r~�˃^.'~w��Ny�G�q�+�wE�L^y�Gޔ�w�G�q�N��:K�Q�ѽq_G���aH=�mm���</����T��R{i{�}U�$r�*�FU������˴E�I�f~w��C�z��ၱ�h|J���b��XY�*]U��< c�x��/�N�HyR��)�W�t4��P�/��bN,�*'R�r1W:%Sy*��~@�e�b��CQ" �!=�$�`S����[�����T� ����Nz(��{�����N���afx��L�xn&f�\lE�X��;2z�biM��{���Z�O%}�4$;��hc����/E������AL�J�M�1�!}�$T"���Ti3�J���&�~]/��<Ac�cJ�ܐ�\���K�I"Q�r1s+s���wbH���ɢ4�P��T`<�ay�',-��p7�u%�}�:�.�F�r�E�H��q�3�U�a���^�:-���)i�M��	n�s�2t,l7|��):�������#��D[9�b�ibM�>���pA���I́�����	"����F|�>Tf����̤u�y噊�뾕+~��~gl��ƝI�#���Ft�]�
)4�s�MT�ó��1�>���sv�I�ûe-hbbx(�����1��&�AA������G����O`%W�4�zi�*V�9�ݲ2!=�r5�'�#>���(K���Ir]&�w6�OV�,��!�@�)r.|+�&XGQ�b8
��;3��J����ױ�� ."	k0?LF���'9<PЅX�(�����[���^�YR�����U��"�����q;�ݣ^�L�<�Rȫ�b�J�`9�0xQ�sa�R[�7p��B��������'��d�Z7Cn���G��p���,ؼ�Pq.�;8!��q�_��2Þ^z6�V���*F¬�(:�.ہ!�"�6�fR+�< e��@)Z��T�J�^42T��Fq!K���H5 �L�<Hk�m8�~��(�4�>�J�^��en������[�o����������ŧ�zʥ�Q�%�o+b�b�����:υ��������޹���\ w8��q�ܼ?j�?Ȗ�?�ɷ�ה�����>_gr�����/���g'/p�
C��O{�\�Sү�)�y�V���r�ǘ����uF���|=�n�ڤT�˘f��b��iy�R�_�.�}��p�m��<���[.~�" Pg��6�v�jy�ZK�j�M�l���4c5�F�����\��ߞ�(h{gkkp%��L5h��_pq<y�j�� H��1P+!��γ��� �o��@w������L-�_,��T�����_�����f�~:vo���i����'��AT���Դ&��;��af/�ᔐ�rҫC���5����W:�Z,�=~�O)��@�ş���<�����_�˟��Q�����tȬ��у����U�E+�t;r�/��oJw�R[�CW#m��������!���Z�x8���5:��g�Ġۏ�r�k��/�Tڳd�g�����{��A���wQ�~���&�06E����D�}�==�כ�٪ ��P(�.~/��<�o�����>�Ź���z�:^J�s�C/�\Rv�k�Qdl"��6��y^�$���}v��Wύ�.�zq��#�̛~�m������Ou����.T��7~ڗu��|��.��Z9|	�zjM<��D�Q��c��G���h��k��P�u��~"���@�����z��~���:�޿��Y�ru�wn�e�ϯ��E�M�hs��d9S���\ao��8��]�W-�L"z�{V���.��i�y�-���'��3��b:���J��|��*�*�|�-�r��@\��z�BV%W~Vgo���	�@ E��M����/k�t���ΕM˦����. uJ�WÌ���9���4mYW�"X�sԇ뱌�Uv�f��2�����(u�Xq�'�<��ԵC)����e.cfO�]>�ҡ�Z�Bɷ�q���L��C^UΚ�x�l֔������d[��B)��ҥ�)�5%��K�V�*@�=SB���2�
\�9�r�8����a�ѡTޑ�9�n�r��pss�߅�m     