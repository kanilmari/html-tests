PGDMP         0        
        {           serlgo    15.2    15.3 �    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    24669    serlgo    DATABASE     {   CREATE DATABASE serlgo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
    DROP DATABASE serlgo;
                postgres    false                        3079    25136 	   tablefunc 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;
    DROP EXTENSION tablefunc;
                   false            <           0    0    EXTENSION tablefunc    COMMENT     `   COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';
                        false    2            �           1247    24992 	   time_unit    TYPE     �   CREATE TYPE public.time_unit AS ENUM (
    'milliseconds',
    'seconds',
    'minutes',
    'hours',
    'days',
    'weeks',
    'months',
    'years'
);
    DROP TYPE public.time_unit;
       public          postgres    false            �            1259    24748    srv    TABLE     �   CREATE TABLE public.srv (
    id integer NOT NULL,
    category_id integer,
    name character varying(255) NOT NULL,
    location_text character varying(255),
    description character varying(16000),
    location_gps point
);
    DROP TABLE public.srv;
       public         heap    postgres    false            �            1259    24753    assets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.assets_id_seq;
       public          postgres    false    247            =           0    0    assets_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.assets_id_seq OWNED BY public.srv.id;
          public          postgres    false    248            �            1259    24739    assets    TABLE     s  CREATE TABLE public.assets (
    id integer DEFAULT nextval('public.assets_id_seq'::regclass) NOT NULL,
    name character varying(255),
    description character varying(16000),
    category_id integer,
    location_text character varying(255),
    location_gps point,
    language character varying(2) DEFAULT 'en'::character varying NOT NULL,
    image_path character varying(255)[],
    phone character varying(255),
    email character varying(255),
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    edited timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer,
    inner_cats jsonb
);
    DROP TABLE public.assets;
       public         heap    postgres    false    248            �            1259    24945    assets_child_items    TABLE     �  CREATE TABLE public.assets_child_items (
    id integer NOT NULL,
    asset_id integer,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    dt_min double precision,
    dt_max double precision,
    left_in_stock double precision,
    dt_unit public.time_unit
);
 &   DROP TABLE public.assets_child_items;
       public         heap    postgres    false    965                       1259    25052    assets_child_items_drafts    TABLE       CREATE TABLE public.assets_child_items_drafts (
    id integer NOT NULL,
    asset_id integer,
    name character varying(255),
    description text,
    price numeric(10,2),
    created timestamp without time zone,
    updated timestamp without time zone,
    dt_min double precision,
    dt_max double precision,
    left_in_stock double precision,
    dt_unit public.time_unit
);
 -   DROP TABLE public.assets_child_items_drafts;
       public         heap    postgres    false    965            �            1259    24944    assets_child_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assets_child_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.assets_child_items_id_seq;
       public          postgres    false    255            >           0    0    assets_child_items_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.assets_child_items_id_seq OWNED BY public.assets_child_items.id;
          public          postgres    false    254                        1259    25045    assets_drafts    TABLE     �  CREATE TABLE public.assets_drafts (
    id integer NOT NULL,
    name character varying(255),
    description character varying(16000),
    category_id integer,
    location_text character varying(255),
    location_gps point,
    language character varying(2),
    image_path character varying(255)[],
    phone character varying(255),
    email character varying(255),
    created timestamp with time zone,
    edited timestamp with time zone
);
 !   DROP TABLE public.assets_drafts;
       public         heap    postgres    false            �            1259    24673 
   categories    TABLE     }   CREATE TABLE public.categories (
    id integer NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    24670    categories3    TABLE     %   CREATE TABLE public.categories3 (
);
    DROP TABLE public.categories3;
       public         heap    postgres    false            �            1259    24676    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    218            ?           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    219                       1259    25079    group_members    TABLE     j   CREATE TABLE public.group_members (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);
 !   DROP TABLE public.group_members;
       public         heap    postgres    false                       1259    25078    group_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.group_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.group_members_id_seq;
       public          postgres    false    261            @           0    0    group_members_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.group_members_id_seq OWNED BY public.group_members.id;
          public          postgres    false    260            	           1259    25103    group_rights    TABLE     �   CREATE TABLE public.group_rights (
    id integer NOT NULL,
    group_id integer,
    right_id integer,
    description character varying(255)
);
     DROP TABLE public.group_rights;
       public         heap    postgres    false                       1259    25102    group_rights_id_seq    SEQUENCE     �   CREATE SEQUENCE public.group_rights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.group_rights_id_seq;
       public          postgres    false    265            A           0    0    group_rights_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.group_rights_id_seq OWNED BY public.group_rights.id;
          public          postgres    false    264                       1259    25072    groups    TABLE     b   CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.groups;
       public         heap    postgres    false                       1259    25071    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    259            B           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    258            �            1259    24910    images    TABLE     �   CREATE TABLE public.images (
    id integer NOT NULL,
    asset_id integer,
    image_path character varying(255) NOT NULL,
    caption text,
    is_default boolean DEFAULT false
);
    DROP TABLE public.images;
       public         heap    postgres    false            �            1259    24909    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    251            C           0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    250            �            1259    24677 	   languages    TABLE     w   CREATE TABLE public.languages (
    language_id integer NOT NULL,
    language_name character varying(255) NOT NULL
);
    DROP TABLE public.languages;
       public         heap    postgres    false            �            1259    24680    languages_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public.languages_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.languages_language_id_seq;
       public          postgres    false    220            D           0    0    languages_language_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.languages_language_id_seq OWNED BY public.languages.language_id;
          public          postgres    false    221            �            1259    24681    location_translations    TABLE     �   CREATE TABLE public.location_translations (
    location_translation_id integer NOT NULL,
    location_id integer,
    language_id integer,
    translated_address character varying(255)
);
 )   DROP TABLE public.location_translations;
       public         heap    postgres    false            �            1259    24684 1   location_translations_location_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_translations_location_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.location_translations_location_translation_id_seq;
       public          postgres    false    222            E           0    0 1   location_translations_location_translation_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.location_translations_location_translation_id_seq OWNED BY public.location_translations.location_translation_id;
          public          postgres    false    223            �            1259    24685 	   locations    TABLE     �   CREATE TABLE public.locations (
    location_id integer NOT NULL,
    address character varying(255) NOT NULL,
    lat double precision,
    lng double precision
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    24688    locations_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.locations_location_id_seq;
       public          postgres    false    224            F           0    0    locations_location_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;
          public          postgres    false    225            �            1259    24689    payment_method_translations    TABLE     �   CREATE TABLE public.payment_method_translations (
    payment_method_translation_id integer NOT NULL,
    payment_method_id integer,
    language_id integer,
    translated_name character varying(255)
);
 /   DROP TABLE public.payment_method_translations;
       public         heap    postgres    false            �            1259    24692 =   payment_method_translations_payment_method_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_method_translations_payment_method_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 T   DROP SEQUENCE public.payment_method_translations_payment_method_translation_id_seq;
       public          postgres    false    226            G           0    0 =   payment_method_translations_payment_method_translation_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.payment_method_translations_payment_method_translation_id_seq OWNED BY public.payment_method_translations.payment_method_translation_id;
          public          postgres    false    227            �            1259    24693    payment_methods    TABLE     �   CREATE TABLE public.payment_methods (
    payment_method_id integer NOT NULL,
    payment_method_name character varying(255) NOT NULL
);
 #   DROP TABLE public.payment_methods;
       public         heap    postgres    false            �            1259    24696 %   payment_methods_payment_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_methods_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.payment_methods_payment_method_id_seq;
       public          postgres    false    228            H           0    0 %   payment_methods_payment_method_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.payment_methods_payment_method_id_seq OWNED BY public.payment_methods.payment_method_id;
          public          postgres    false    229            �            1259    24697    product_translations    TABLE     �   CREATE TABLE public.product_translations (
    product_translation_id integer NOT NULL,
    product_id integer,
    language_id integer,
    translated_name character varying(255),
    translated_description text
);
 (   DROP TABLE public.product_translations;
       public         heap    postgres    false            �            1259    24702 /   product_translations_product_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_translations_product_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.product_translations_product_translation_id_seq;
       public          postgres    false    230            I           0    0 /   product_translations_product_translation_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.product_translations_product_translation_id_seq OWNED BY public.product_translations.product_translation_id;
          public          postgres    false    231            �            1259    24703    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    product_description text,
    product_image_url character varying(255)
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    24708    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    232            J           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    233            �            1259    24709    review_criteria    TABLE     �   CREATE TABLE public.review_criteria (
    id integer NOT NULL,
    category_id integer,
    label character varying(255) NOT NULL
);
 #   DROP TABLE public.review_criteria;
       public         heap    postgres    false            �            1259    24712    review_criteria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.review_criteria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.review_criteria_id_seq;
       public          postgres    false    234            K           0    0    review_criteria_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.review_criteria_id_seq OWNED BY public.review_criteria.id;
          public          postgres    false    235            �            1259    24713    review_ratings    TABLE     �   CREATE TABLE public.review_ratings (
    id integer NOT NULL,
    review_id integer,
    criterion_id integer,
    rating integer NOT NULL
);
 "   DROP TABLE public.review_ratings;
       public         heap    postgres    false            �            1259    24716    review_ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.review_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.review_ratings_id_seq;
       public          postgres    false    236            L           0    0    review_ratings_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.review_ratings_id_seq OWNED BY public.review_ratings.id;
          public          postgres    false    237            �            1259    24717    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer,
    service_id integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    24723    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    238            M           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    239                       1259    25096    rights    TABLE     �   CREATE TABLE public.rights (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    needs_recursive_actions boolean
);
    DROP TABLE public.rights;
       public         heap    postgres    false                       1259    25095    rights_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.rights_id_seq;
       public          postgres    false    263            N           0    0    rights_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.rights_id_seq OWNED BY public.rights.id;
          public          postgres    false    262            �            1259    24724    service_locations    TABLE     m   CREATE TABLE public.service_locations (
    service_id integer NOT NULL,
    location_id integer NOT NULL
);
 %   DROP TABLE public.service_locations;
       public         heap    postgres    false            �            1259    24727    service_payment_methods    TABLE     y   CREATE TABLE public.service_payment_methods (
    service_id integer NOT NULL,
    payment_method_id integer NOT NULL
);
 +   DROP TABLE public.service_payment_methods;
       public         heap    postgres    false            �            1259    24730    service_products    TABLE     �   CREATE TABLE public.service_products (
    service_id integer NOT NULL,
    product_id integer NOT NULL,
    price numeric(10,2),
    available boolean,
    discount numeric(10,2),
    delivery_time character varying(255)
);
 $   DROP TABLE public.service_products;
       public         heap    postgres    false            �            1259    24733    service_translations    TABLE     �   CREATE TABLE public.service_translations (
    service_translation_id integer NOT NULL,
    service_id integer,
    language_id integer,
    translated_name character varying(255),
    translated_description text
);
 (   DROP TABLE public.service_translations;
       public         heap    postgres    false            �            1259    24738 /   service_translations_service_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_translations_service_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.service_translations_service_translation_id_seq;
       public          postgres    false    243            O           0    0 /   service_translations_service_translation_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.service_translations_service_translation_id_seq OWNED BY public.service_translations.service_translation_id;
          public          postgres    false    244            �            1259    24745    services.old    TABLE     z   CREATE TABLE public."services.old" (
    service_id integer NOT NULL,
    service_name character varying(255) NOT NULL
);
 "   DROP TABLE public."services.old";
       public         heap    postgres    false            �            1259    24754    services_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.services_service_id_seq;
       public          postgres    false    246            P           0    0    services_service_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.services_service_id_seq OWNED BY public."services.old".service_id;
          public          postgres    false    249            �            1259    24930    users    TABLE     I  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(512) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24929    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    253            Q           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    252                       2604    24948    assets_child_items id    DEFAULT     ~   ALTER TABLE ONLY public.assets_child_items ALTER COLUMN id SET DEFAULT nextval('public.assets_child_items_id_seq'::regclass);
 D   ALTER TABLE public.assets_child_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255                       2604    24755    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                       2604    25082    group_members id    DEFAULT     t   ALTER TABLE ONLY public.group_members ALTER COLUMN id SET DEFAULT nextval('public.group_members_id_seq'::regclass);
 ?   ALTER TABLE public.group_members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    261    261                        2604    25106    group_rights id    DEFAULT     r   ALTER TABLE ONLY public.group_rights ALTER COLUMN id SET DEFAULT nextval('public.group_rights_id_seq'::regclass);
 >   ALTER TABLE public.group_rights ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264    265                       2604    25075 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258    259                       2604    24913 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251                       2604    24756    languages language_id    DEFAULT     ~   ALTER TABLE ONLY public.languages ALTER COLUMN language_id SET DEFAULT nextval('public.languages_language_id_seq'::regclass);
 D   ALTER TABLE public.languages ALTER COLUMN language_id DROP DEFAULT;
       public          postgres    false    221    220                       2604    24757 -   location_translations location_translation_id    DEFAULT     �   ALTER TABLE ONLY public.location_translations ALTER COLUMN location_translation_id SET DEFAULT nextval('public.location_translations_location_translation_id_seq'::regclass);
 \   ALTER TABLE public.location_translations ALTER COLUMN location_translation_id DROP DEFAULT;
       public          postgres    false    223    222                       2604    24758    locations location_id    DEFAULT     ~   ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);
 D   ALTER TABLE public.locations ALTER COLUMN location_id DROP DEFAULT;
       public          postgres    false    225    224                       2604    24759 9   payment_method_translations payment_method_translation_id    DEFAULT     �   ALTER TABLE ONLY public.payment_method_translations ALTER COLUMN payment_method_translation_id SET DEFAULT nextval('public.payment_method_translations_payment_method_translation_id_seq'::regclass);
 h   ALTER TABLE public.payment_method_translations ALTER COLUMN payment_method_translation_id DROP DEFAULT;
       public          postgres    false    227    226                       2604    24760 !   payment_methods payment_method_id    DEFAULT     �   ALTER TABLE ONLY public.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_methods_payment_method_id_seq'::regclass);
 P   ALTER TABLE public.payment_methods ALTER COLUMN payment_method_id DROP DEFAULT;
       public          postgres    false    229    228                       2604    24761 +   product_translations product_translation_id    DEFAULT     �   ALTER TABLE ONLY public.product_translations ALTER COLUMN product_translation_id SET DEFAULT nextval('public.product_translations_product_translation_id_seq'::regclass);
 Z   ALTER TABLE public.product_translations ALTER COLUMN product_translation_id DROP DEFAULT;
       public          postgres    false    231    230            	           2604    24762    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    233    232            
           2604    24763    review_criteria id    DEFAULT     x   ALTER TABLE ONLY public.review_criteria ALTER COLUMN id SET DEFAULT nextval('public.review_criteria_id_seq'::regclass);
 A   ALTER TABLE public.review_criteria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234                       2604    24764    review_ratings id    DEFAULT     v   ALTER TABLE ONLY public.review_ratings ALTER COLUMN id SET DEFAULT nextval('public.review_ratings_id_seq'::regclass);
 @   ALTER TABLE public.review_ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                       2604    24765 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238                       2604    25099 	   rights id    DEFAULT     f   ALTER TABLE ONLY public.rights ALTER COLUMN id SET DEFAULT nextval('public.rights_id_seq'::regclass);
 8   ALTER TABLE public.rights ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262    263                       2604    24766 +   service_translations service_translation_id    DEFAULT     �   ALTER TABLE ONLY public.service_translations ALTER COLUMN service_translation_id SET DEFAULT nextval('public.service_translations_service_translation_id_seq'::regclass);
 Z   ALTER TABLE public.service_translations ALTER COLUMN service_translation_id DROP DEFAULT;
       public          postgres    false    244    243                       2604    24767    services.old service_id    DEFAULT     �   ALTER TABLE ONLY public."services.old" ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);
 H   ALTER TABLE public."services.old" ALTER COLUMN service_id DROP DEFAULT;
       public          postgres    false    249    246                       2604    24768    srv id    DEFAULT     c   ALTER TABLE ONLY public.srv ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);
 5   ALTER TABLE public.srv ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247                       2604    24933    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253            !          0    24739    assets 
   TABLE DATA           �   COPY public.assets (id, name, description, category_id, location_text, location_gps, language, image_path, phone, email, created, edited, user_id, inner_cats) FROM stdin;
    public          postgres    false    245   �      +          0    24945    assets_child_items 
   TABLE DATA           �   COPY public.assets_child_items (id, asset_id, name, description, price, created, updated, dt_min, dt_max, left_in_stock, dt_unit) FROM stdin;
    public          postgres    false    255   �      -          0    25052    assets_child_items_drafts 
   TABLE DATA           �   COPY public.assets_child_items_drafts (id, asset_id, name, description, price, created, updated, dt_min, dt_max, left_in_stock, dt_unit) FROM stdin;
    public          postgres    false    257   �       ,          0    25045    assets_drafts 
   TABLE DATA           �   COPY public.assets_drafts (id, name, description, category_id, location_text, location_gps, language, image_path, phone, email, created, edited) FROM stdin;
    public          postgres    false    256   �                 0    24673 
   categories 
   TABLE DATA           9   COPY public.categories (id, parent_id, name) FROM stdin;
    public          postgres    false    218   !                0    24670    categories3 
   TABLE DATA           %   COPY public.categories3  FROM stdin;
    public          postgres    false    217   m)      1          0    25079    group_members 
   TABLE DATA           >   COPY public.group_members (id, user_id, group_id) FROM stdin;
    public          postgres    false    261   �)      5          0    25103    group_rights 
   TABLE DATA           K   COPY public.group_rights (id, group_id, right_id, description) FROM stdin;
    public          postgres    false    265   �)      /          0    25072    groups 
   TABLE DATA           *   COPY public.groups (id, name) FROM stdin;
    public          postgres    false    259   �)      '          0    24910    images 
   TABLE DATA           O   COPY public.images (id, asset_id, image_path, caption, is_default) FROM stdin;
    public          postgres    false    251   n*                0    24677 	   languages 
   TABLE DATA           ?   COPY public.languages (language_id, language_name) FROM stdin;
    public          postgres    false    220   �+      
          0    24681    location_translations 
   TABLE DATA           v   COPY public.location_translations (location_translation_id, location_id, language_id, translated_address) FROM stdin;
    public          postgres    false    222   ,                0    24685 	   locations 
   TABLE DATA           C   COPY public.locations (location_id, address, lat, lng) FROM stdin;
    public          postgres    false    224   2,                0    24689    payment_method_translations 
   TABLE DATA           �   COPY public.payment_method_translations (payment_method_translation_id, payment_method_id, language_id, translated_name) FROM stdin;
    public          postgres    false    226   O,                0    24693    payment_methods 
   TABLE DATA           Q   COPY public.payment_methods (payment_method_id, payment_method_name) FROM stdin;
    public          postgres    false    228   l,                0    24697    product_translations 
   TABLE DATA           �   COPY public.product_translations (product_translation_id, product_id, language_id, translated_name, translated_description) FROM stdin;
    public          postgres    false    230   �,                0    24703    products 
   TABLE DATA           d   COPY public.products (product_id, product_name, product_description, product_image_url) FROM stdin;
    public          postgres    false    232   �,                0    24709    review_criteria 
   TABLE DATA           A   COPY public.review_criteria (id, category_id, label) FROM stdin;
    public          postgres    false    234   �,                0    24713    review_ratings 
   TABLE DATA           M   COPY public.review_ratings (id, review_id, criterion_id, rating) FROM stdin;
    public          postgres    false    236   �,                0    24717    reviews 
   TABLE DATA           O   COPY public.reviews (id, user_id, service_id, comment, created_at) FROM stdin;
    public          postgres    false    238   �,      3          0    25096    rights 
   TABLE DATA           C   COPY public.rights (id, name, needs_recursive_actions) FROM stdin;
    public          postgres    false    263   -                0    24724    service_locations 
   TABLE DATA           D   COPY public.service_locations (service_id, location_id) FROM stdin;
    public          postgres    false    240   �-                0    24727    service_payment_methods 
   TABLE DATA           P   COPY public.service_payment_methods (service_id, payment_method_id) FROM stdin;
    public          postgres    false    241   �-                0    24730    service_products 
   TABLE DATA           m   COPY public.service_products (service_id, product_id, price, available, discount, delivery_time) FROM stdin;
    public          postgres    false    242   .                0    24733    service_translations 
   TABLE DATA           �   COPY public.service_translations (service_translation_id, service_id, language_id, translated_name, translated_description) FROM stdin;
    public          postgres    false    243   -.      "          0    24745    services.old 
   TABLE DATA           B   COPY public."services.old" (service_id, service_name) FROM stdin;
    public          postgres    false    246   J.      #          0    24748    srv 
   TABLE DATA           ^   COPY public.srv (id, category_id, name, location_text, description, location_gps) FROM stdin;
    public          postgres    false    247   ~.      )          0    24930    users 
   TABLE DATA           [   COPY public.users (id, username, email, password_hash, created_at, updated_at) FROM stdin;
    public          postgres    false    253   s/      R           0    0    assets_child_items_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.assets_child_items_id_seq', 50, true);
          public          postgres    false    254            S           0    0    assets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.assets_id_seq', 278, true);
          public          postgres    false    248            T           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    219            U           0    0    group_members_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.group_members_id_seq', 6, true);
          public          postgres    false    260            V           0    0    group_rights_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.group_rights_id_seq', 1661, true);
          public          postgres    false    264            W           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 1, false);
          public          postgres    false    258            X           0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 35, true);
          public          postgres    false    250            Y           0    0    languages_language_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.languages_language_id_seq', 1, false);
          public          postgres    false    221            Z           0    0 1   location_translations_location_translation_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.location_translations_location_translation_id_seq', 1, false);
          public          postgres    false    223            [           0    0    locations_location_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);
          public          postgres    false    225            \           0    0 =   payment_method_translations_payment_method_translation_id_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('public.payment_method_translations_payment_method_translation_id_seq', 1, false);
          public          postgres    false    227            ]           0    0 %   payment_methods_payment_method_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 1, false);
          public          postgres    false    229            ^           0    0 /   product_translations_product_translation_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.product_translations_product_translation_id_seq', 1, false);
          public          postgres    false    231            _           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);
          public          postgres    false    233            `           0    0    review_criteria_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.review_criteria_id_seq', 1, false);
          public          postgres    false    235            a           0    0    review_ratings_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.review_ratings_id_seq', 1, false);
          public          postgres    false    237            b           0    0    reviews_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);
          public          postgres    false    239            c           0    0    rights_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.rights_id_seq', 1, true);
          public          postgres    false    262            d           0    0 /   service_translations_service_translation_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.service_translations_service_translation_id_seq', 1, false);
          public          postgres    false    244            e           0    0    services_service_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.services_service_id_seq', 1, true);
          public          postgres    false    249            f           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    252            N           2606    24954 *   assets_child_items assets_child_items_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.assets_child_items
    ADD CONSTRAINT assets_child_items_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.assets_child_items DROP CONSTRAINT assets_child_items_pkey;
       public            postgres    false    255            P           2606    25051     assets_drafts assets_drafts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.assets_drafts
    ADD CONSTRAINT assets_drafts_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.assets_drafts DROP CONSTRAINT assets_drafts_pkey;
       public            postgres    false    256            @           2606    24804    assets assets_pkey2 
   CONSTRAINT     Q   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey2 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey2;
       public            postgres    false    245            "           2606    24770    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    218            R           2606    25058 1   assets_child_items_drafts child_items_drafts_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.assets_child_items_drafts
    ADD CONSTRAINT child_items_drafts_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.assets_child_items_drafts DROP CONSTRAINT child_items_drafts_pkey;
       public            postgres    false    257            V           2606    25084     group_members group_members_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_pkey;
       public            postgres    false    261            Z           2606    25108    group_rights group_rights_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.group_rights
    ADD CONSTRAINT group_rights_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.group_rights DROP CONSTRAINT group_rights_pkey;
       public            postgres    false    265            T           2606    25077    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    259            F           2606    24918    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    251            $           2606    24772    languages languages_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (language_id);
 B   ALTER TABLE ONLY public.languages DROP CONSTRAINT languages_pkey;
       public            postgres    false    220            &           2606    24774 0   location_translations location_translations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.location_translations
    ADD CONSTRAINT location_translations_pkey PRIMARY KEY (location_translation_id);
 Z   ALTER TABLE ONLY public.location_translations DROP CONSTRAINT location_translations_pkey;
       public            postgres    false    222            (           2606    24776    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    224            *           2606    24778 <   payment_method_translations payment_method_translations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.payment_method_translations
    ADD CONSTRAINT payment_method_translations_pkey PRIMARY KEY (payment_method_translation_id);
 f   ALTER TABLE ONLY public.payment_method_translations DROP CONSTRAINT payment_method_translations_pkey;
       public            postgres    false    226            ,           2606    24780 $   payment_methods payment_methods_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);
 N   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_pkey;
       public            postgres    false    228            .           2606    24782 .   product_translations product_translations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_pkey PRIMARY KEY (product_translation_id);
 X   ALTER TABLE ONLY public.product_translations DROP CONSTRAINT product_translations_pkey;
       public            postgres    false    230            0           2606    24784    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    232            2           2606    24786 $   review_criteria review_criteria_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.review_criteria
    ADD CONSTRAINT review_criteria_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.review_criteria DROP CONSTRAINT review_criteria_pkey;
       public            postgres    false    234            4           2606    24788 "   review_ratings review_ratings_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.review_ratings
    ADD CONSTRAINT review_ratings_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.review_ratings DROP CONSTRAINT review_ratings_pkey;
       public            postgres    false    236            6           2606    24790    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    238            X           2606    25101    rights rights_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.rights DROP CONSTRAINT rights_pkey;
       public            postgres    false    263            8           2606    24792 (   service_locations service_locations_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.service_locations
    ADD CONSTRAINT service_locations_pkey PRIMARY KEY (service_id, location_id);
 R   ALTER TABLE ONLY public.service_locations DROP CONSTRAINT service_locations_pkey;
       public            postgres    false    240    240            :           2606    24794 4   service_payment_methods service_payment_methods_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.service_payment_methods
    ADD CONSTRAINT service_payment_methods_pkey PRIMARY KEY (service_id, payment_method_id);
 ^   ALTER TABLE ONLY public.service_payment_methods DROP CONSTRAINT service_payment_methods_pkey;
       public            postgres    false    241    241            <           2606    24796 &   service_products service_products_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.service_products
    ADD CONSTRAINT service_products_pkey PRIMARY KEY (service_id, product_id);
 P   ALTER TABLE ONLY public.service_products DROP CONSTRAINT service_products_pkey;
       public            postgres    false    242    242            >           2606    24798 .   service_translations service_translations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.service_translations
    ADD CONSTRAINT service_translations_pkey PRIMARY KEY (service_translation_id);
 X   ALTER TABLE ONLY public.service_translations DROP CONSTRAINT service_translations_pkey;
       public            postgres    false    243            B           2606    24800    services.old services_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."services.old"
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);
 F   ALTER TABLE ONLY public."services.old" DROP CONSTRAINT services_pkey;
       public            postgres    false    246            D           2606    24802    srv services_pkey1 
   CONSTRAINT     P   ALTER TABLE ONLY public.srv
    ADD CONSTRAINT services_pkey1 PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.srv DROP CONSTRAINT services_pkey1;
       public            postgres    false    247            H           2606    24943    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    253            J           2606    24939    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    253            L           2606    24941    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    253            q           2606    24955 5   assets_child_items assets_child_items_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assets_child_items
    ADD CONSTRAINT assets_child_items_service_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);
 _   ALTER TABLE ONLY public.assets_child_items DROP CONSTRAINT assets_child_items_service_id_fkey;
       public          postgres    false    245    255    3392            n           2606    25066    assets assets_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_user_id_fkey;
       public          postgres    false    245    253    3402            [           2606    24805 $   categories categories_parent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id);
 N   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parent_id_fkey;
       public          postgres    false    3362    218    218            r           2606    25059 :   assets_child_items_drafts child_items_drafts_asset_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assets_child_items_drafts
    ADD CONSTRAINT child_items_drafts_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets_drafts(id);
 d   ALTER TABLE ONLY public.assets_child_items_drafts DROP CONSTRAINT child_items_drafts_asset_id_fkey;
       public          postgres    false    256    3408    257            s           2606    25090 )   group_members group_members_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_group_id_fkey;
       public          postgres    false    259    3412    261            t           2606    25085 *   group_members group_members_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_member_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_member_id_fkey;
       public          postgres    false    3402    261    253            u           2606    25109 '   group_rights group_rights_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_rights
    ADD CONSTRAINT group_rights_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.group_rights DROP CONSTRAINT group_rights_group_id_fkey;
       public          postgres    false    3412    265    259            v           2606    25114 '   group_rights group_rights_right_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_rights
    ADD CONSTRAINT group_rights_right_id_fkey FOREIGN KEY (right_id) REFERENCES public.rights(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.group_rights DROP CONSTRAINT group_rights_right_id_fkey;
       public          postgres    false    265    263    3416            p           2606    24919    images images_service_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_service_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);
 G   ALTER TABLE ONLY public.images DROP CONSTRAINT images_service_id_fkey;
       public          postgres    false    251    3392    245            \           2606    24810 <   location_translations location_translations_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_translations
    ADD CONSTRAINT location_translations_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(language_id);
 f   ALTER TABLE ONLY public.location_translations DROP CONSTRAINT location_translations_language_id_fkey;
       public          postgres    false    222    3364    220            ]           2606    24815 <   location_translations location_translations_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_translations
    ADD CONSTRAINT location_translations_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 f   ALTER TABLE ONLY public.location_translations DROP CONSTRAINT location_translations_location_id_fkey;
       public          postgres    false    222    3368    224            ^           2606    24820 H   payment_method_translations payment_method_translations_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_method_translations
    ADD CONSTRAINT payment_method_translations_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(language_id);
 r   ALTER TABLE ONLY public.payment_method_translations DROP CONSTRAINT payment_method_translations_language_id_fkey;
       public          postgres    false    226    3364    220            _           2606    24825 N   payment_method_translations payment_method_translations_payment_method_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_method_translations
    ADD CONSTRAINT payment_method_translations_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id);
 x   ALTER TABLE ONLY public.payment_method_translations DROP CONSTRAINT payment_method_translations_payment_method_id_fkey;
       public          postgres    false    3372    226    228            `           2606    24830 :   product_translations product_translations_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(language_id);
 d   ALTER TABLE ONLY public.product_translations DROP CONSTRAINT product_translations_language_id_fkey;
       public          postgres    false    230    3364    220            a           2606    24835 9   product_translations product_translations_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 c   ALTER TABLE ONLY public.product_translations DROP CONSTRAINT product_translations_product_id_fkey;
       public          postgres    false    230    3376    232            b           2606    24840 0   review_criteria review_criteria_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_criteria
    ADD CONSTRAINT review_criteria_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 Z   ALTER TABLE ONLY public.review_criteria DROP CONSTRAINT review_criteria_category_id_fkey;
       public          postgres    false    234    3362    218            c           2606    24845 /   review_ratings review_ratings_criterion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_ratings
    ADD CONSTRAINT review_ratings_criterion_id_fkey FOREIGN KEY (criterion_id) REFERENCES public.review_criteria(id);
 Y   ALTER TABLE ONLY public.review_ratings DROP CONSTRAINT review_ratings_criterion_id_fkey;
       public          postgres    false    236    3378    234            d           2606    24850 ,   review_ratings review_ratings_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_ratings
    ADD CONSTRAINT review_ratings_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id);
 V   ALTER TABLE ONLY public.review_ratings DROP CONSTRAINT review_ratings_review_id_fkey;
       public          postgres    false    3382    238    236            e           2606    24855    reviews reviews_service_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.srv(id);
 I   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_service_id_fkey;
       public          postgres    false    238    3396    247            f           2606    24860 4   service_locations service_locations_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_locations
    ADD CONSTRAINT service_locations_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 ^   ALTER TABLE ONLY public.service_locations DROP CONSTRAINT service_locations_location_id_fkey;
       public          postgres    false    240    3368    224            g           2606    24865 3   service_locations service_locations_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_locations
    ADD CONSTRAINT service_locations_service_id_fkey FOREIGN KEY (service_id) REFERENCES public."services.old"(service_id);
 ]   ALTER TABLE ONLY public.service_locations DROP CONSTRAINT service_locations_service_id_fkey;
       public          postgres    false    240    3394    246            h           2606    24870 F   service_payment_methods service_payment_methods_payment_method_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_payment_methods
    ADD CONSTRAINT service_payment_methods_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id);
 p   ALTER TABLE ONLY public.service_payment_methods DROP CONSTRAINT service_payment_methods_payment_method_id_fkey;
       public          postgres    false    241    3372    228            i           2606    24875 ?   service_payment_methods service_payment_methods_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_payment_methods
    ADD CONSTRAINT service_payment_methods_service_id_fkey FOREIGN KEY (service_id) REFERENCES public."services.old"(service_id);
 i   ALTER TABLE ONLY public.service_payment_methods DROP CONSTRAINT service_payment_methods_service_id_fkey;
       public          postgres    false    241    3394    246            j           2606    24880 1   service_products service_products_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_products
    ADD CONSTRAINT service_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 [   ALTER TABLE ONLY public.service_products DROP CONSTRAINT service_products_product_id_fkey;
       public          postgres    false    242    3376    232            k           2606    24885 1   service_products service_products_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_products
    ADD CONSTRAINT service_products_service_id_fkey FOREIGN KEY (service_id) REFERENCES public."services.old"(service_id);
 [   ALTER TABLE ONLY public.service_products DROP CONSTRAINT service_products_service_id_fkey;
       public          postgres    false    242    3394    246            l           2606    24890 :   service_translations service_translations_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_translations
    ADD CONSTRAINT service_translations_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(language_id);
 d   ALTER TABLE ONLY public.service_translations DROP CONSTRAINT service_translations_language_id_fkey;
       public          postgres    false    243    3364    220            m           2606    24895 9   service_translations service_translations_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_translations
    ADD CONSTRAINT service_translations_service_id_fkey FOREIGN KEY (service_id) REFERENCES public."services.old"(service_id);
 c   ALTER TABLE ONLY public.service_translations DROP CONSTRAINT service_translations_service_id_fkey;
       public          postgres    false    243    3394    246            o           2606    24900    srv services_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.srv
    ADD CONSTRAINT services_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 G   ALTER TABLE ONLY public.srv DROP CONSTRAINT services_category_id_fkey;
       public          postgres    false    247    218    3362            !      x��\Yr�F�~�OQO������i�vo�n[�������,�%,Eca��!��2�t����a�(���VY@eee~�eD��A>Ȋ��/Q����<�|�7~l[��\	V�����`�vp�.E��KQ2�/�zE��^�|Ŗ*�D^F^�R-%�+V��z�D�!W��+��B��goDZ�<�W��K�rYV��Ʒ�eڡeGa|�xf��N��j����O�c9���,�Z�|g�uY��c�N�'�u���g^��؉TmI72B��������'�
��g���6�K^I����>�YV��+Z�B�`C���*UR������٫��KY.���x��OS�7�uC3��ja;��ٱ��Ku�7���uZa�={_�L��[QT��h4����2�+�Z�+H�;&�m��B�B�� X��U�R�{!�=Sk�|6��mӷB�j�mt���W�ߧJe�_~�%���H�\�%��r���Z䎜��� ��I�Z5�׎�p���%�
�Mp.�,x���\���"C`žk|���W���I|f��"1��,3���jz�e�a���J��-p��U��=�k�7^�l[���K�lݏܦ<ϵ� ��D�lfo Ӱ-۸ۯr��Q�|_#�N?`�\VƷ�5���=��Ʈ:V������=��^�"3#�vo�&��eUC��B����pZ�-���p��[^��=��ؕrrŧ�ƖDf���c���|�ʡq��u����b����h\A�TYV�օ(7���z	���BWl�e�``�*�ld�X'5��7�(��l76���^�ȸGL�[UTt�,�k�0���A��"<�#�J�a�qY��l�ᄋSߋ"����@�1}1=���e C�+x�^�?��˺ {ߩ�րd���r4��Jі �+�Wu�>u�3Y/t�+n��� ٶe�e�p~�e��/�F�UmϪ�/n] !��:�	�hŊ���챎{K��8BB��x���6ŋ}e[{;�ΰ(����7*�U] Jj��?ܴ;���Ԫ�u7�!5۴ҷ�8��e�T���_��B�c+\3��8��g� ��v��j��+Y�B#�؂��� �W���Tu�D4\��ni0vb���/�]�!�^��9*������zH�*ׇOّ�xn���خ��Zl�����=ȉ�^p�T-�+(cB��&q����fdȁ�82���D������s�g�$�O���Rչ�:{����k�����ZE���	ܪ��DO�Mְ�mb״�4χa�fz?����}!�T­��9"�&�?o��f�{*U{�[�^�;ؙ�&�(㏴���#0�b���"�Ċ���+�u�k�9�< 7z a�W5��E*x&�ZôpD��%���	�9�*ת�
.���� O�Z	����#4B�/+��e��f�|(��?�I�13Yc�v)�`�����c�c':V��9�76LG~���҇�q��4Jv� .!�k"�Y�T�g�w����Ď��z{+u^®Н��(�o;��u3���z-�ww��:Q˳�u�2^��^a�\���:��I[w-�����~tK)�z�weJ�� �sR�6n��*>��,��a�y�v\�>H�eJG�a?<�rp�%���X��:�7��5R���q˰�ׄP��!�XB%�;p��A=�m21�XZ�&GQu���m��/-�㷃4�;3:τ�P/h����nuU�!�E��K�uSgnAȔ:�?���տ(H9�q+*��XXT�����q\k��sX�Z��5(8�;2\x!`
��[	j������Ġ?�d��� �v_��T�����\]k��y�)l�_3^;o Dь-��� 	��8��u6*[������T	i�JQ��" r	7�(�x�\�8�es�v�CD����)F,:���30��>C}Uj��6b�}`kY��z��y�R}LCC���=7&�_��/��hD�����{�x�S^Q�myM<o�������n�>�~�U)���eZ�Q��m�ꑃ��ZX�B��}CUP�нJ��q+����Wԝy]�-R�A��!�(��iq>�C�쬗�	N����x��L�(�(.)��d���-d�ѮP{[�CZ��P��+��e�Ð�k���+p����z���7����<��ǥ6bd϶�4Ѓ����'�*���}[.]�#)�tM�T�m�����@@�;?6�\���*�UǶ#���bl1�D-�쌡M{Cd���˂R�nx����8\j���3X8�L��K�Y7�� ��Yj_t"�v��?��t���(P����m�ޅ�&6@V�=46LP�r���n�Ѳ�t����U�u9h�,�u!��^¯�݁%��N�*��q��7�	N*ќ�bs/�3�[w��nݗm���I���(ؔ��L���a%�a����sÍ���"1i���
��aO����!D�1����/n���\|<��A��`oP�C��U ��KT��咎�Ԫ9�n<這�ep��W-/~�:��ޜ���9Oקv��Hڛ���M
�~����/�=O������ėЬ�G���dj*D�����W�{���bN`��k񺦜th����a=1�6p�1�Ǘ��Р6/�*�>0�.�\��T�A-*&�]���Es\^�B7#��g��Ğ����)���?��/	��[n��w&v�۩L��8ʍ�8��=r���$��`����ӗ2٧O_���TFo�f�x���ӡt^˯�md�BtI�^!wT����W��s�{-ت�U�$�
��p���,P�>4o�S�S�ڗ���폼F�Ԩ~G<��8$]��<�����辡��W�8{�\}˸K��e�@}��M�����g	Zk��d&��2������5;�z[-��V��Q8��T<��xs>�T-�)��mԅ�ˡ����R2�s����Gn�A��i��8�%��6"Od��g�6p?�
}�~^�[��t�qM�����[�]���~�_�s�3�8&������sS�7���+�eA�D݅�b{=E +��<}�6�~��\�+��LJ$�LĎs:�K��u�gX�
ߴP�Ry�o�a�q/6*I8��v�W	�[WH�ţ�Y�V���JNCZ[[�6�"%�U"6z�O_L�z�<C|�!�zq�\9��P�7��D�
ŵ|]u�**|��~q���t�MS��#��ے�2M��G��"��>��vt�0v� 8�Ҡ	u�R���y8������Z�%孍��<�(Y����7))�3$�~~���RC��
��
�C�[*��޸�2x,ԁn�k���d"����D�ȇ�d�`|��!0Sl�ǔt=���A�����d=h}ߌ`
�5�v-�;sQ�PQq�σ~|�R�D���=���56>K��K��f����1|��q�/K��b���'�A@���Y�#�/O9��8p}���x>v͊��"=�7H#JP/-�m7Qj�������I�����2����j���L�!#��~_�������r��m��B,�Hdΐ$sU�z�͜�j����c��2E���Z���,��7�ҏϠ>��, &2�'��)9l�|~�IC�4��'=~�N4H3�:�`�?{�A��3!\'y���z4��K�|�),�f<A:>	�J���܄t�Q%6#g��^�1�d�m�Cs*��r�}(>��e������=��PKə;c����r8�ߜ�uf'&���7� �Z��0>�g %��ӟ4�t���{T����܄?*���c�X�&�r��V!Щ����7+�LP4�MPp��)B�R,E��'u=	Xc��cۄ<HĶ^�B1��h��-��rՐ�VI���G�����s��Z��e��brC΄ 2v����ԁ�� `x��IS��sѰeuϚ�C�̀�,5~f�}?}1>�_���'>2��c;ڌ��\��Tm#Ⱥ@����T����S�>���W�*Խ:
T���ʄ�m���/(��nMj�͟���b:�?J" I�J�k{�~��#yBE��\�+���� �  ��I{��^��:�%>����w`��뾛�Co�#|:���Q��N��I�W��n�$�/*��f��Ȧ�0���|y��;�	�|���-/6T�'�8#qg�AԊ���Гd(��F���� *$�Q���H�M����J�)���2�X��`�j���mS��-�(��o���ai)߶]���v��S4#r���#�]d�Q�A�ȸ1F�U�3*]T"r!��-P�	ua.��j7��t�3�Kmh��ؾ�/y�1@CR�1�~Ǎ��$	�W�UCg(�imE/u�Q햺��ys��jz�Me��2����f�����{1Q���2JH�~u�Ͳ.�P"۸��<�����"Ƈ�+@sY<�|�a����Z:��ɩ���ٛI�c�D�˼��"�2�X�7�v���6"�1��/o�2�u��[Dh�e`/u�a!�6��r\*�"\#��+�%�-�fh��o��ES5͂���$.#�</lp9<��|�c�_��B�W�KJ������������`CW
����vd�C��&M��*!��b�f4�``�1�ƶ�/ɨ������wGj%ž�\�a�)Y[W6}�%�2�ggQd��_Lt����n|��nP�[9]3*��w��a�:gą����{^���}�h� ���Ωj�Ĥ�;�췧?AS���ҏ��OV�O�Nm�{�*��^��҈����~�)[Gk��f�0�f�>Ŏ����K��� �ON�Z�ӇJ]O�&t�_�I@�^�>��_& ��G�T$�E+���bX#��Hs.��1*����!�y��0�uA&ʚ��.��;�ق�^����U��z���>B�j�����l��]��A� ���d%��7Ό��n��C�z����~�OBs��^�nQ�weu�/����(ʶ��;��eC��������J�q�0��yK�t��u�7��1d�>�uc������)���~�g5z����2�=�fm���Y��Asfw^�6�_��B���{��C�R���BK*�s�!J���˄��@���M^?�q�^��y�#�7d0���a��.w�	�h�'� :���9A<�(��H�v����	�'p�d��&�jw<�E�w�_5�?6�{f�=2������k�'�����<5���O��Y�j��Tg����<՛��,O�%��Yb+�%��Yb+�%��Yb+�%��Yb+�%��Yb+�%��Yb+�%��9b˱�-���9�:GУ�x�Q�Xψ;���k��?7�={��	i7�3b���^��I_]�NLq,�fxF|�ѵ^��D��p<ũ����BO��mǴ]�w��I�9�g�N�ߴ�(r��9��n�gD���0�	����ci7�3r=%�vӊ]ϛX�X�����S<�,�V�x����X׎{�F�X��sLH�9��x�G?f�EQ0�Մ���Q�<ŷ`��Ǿ;!��xF�;07��1��
ݓu�J�9���S|�F�MO1v3<#��!.��B?��b$m�p�����s?:ٍSi;���(�S���
�8v�8:�c,��x�:��X��HN����7��]��0�O�K�9�g���y�6��m���n������76}���	S�����<�M��(���X�����}�8�kY���9��n����oF����#i7Gd���9X�7;�r�G!J:�����%�r��+F�;U�꺔�XR�ͻ�����g�~d��+v*��/��s�!��A��`֩�U̷.��O�c�埤�Si��=R��Ys5i(\ߍ�㘟�v�9�+���zp�S���N1w~�xᇏ~��X�)�ͯ�� ���Ωbci��?�b�&�&8��a�V0�Z޵�}(�m�?��T�)^@1�ڏ���֔b#i����P)�E���#ܟ�v��q��M�ۣ�aR�*�q�<�p�)����b��גR۶�p��F�N��q��"
hY�3��X�)6;�c�f1=�F�Slv��S{�i��O��X�)6;��5�&v,�� �����I��L��X�)67��Uնo��-�)6!���Q�;�5m�
]w�ة�Sln���l���~t��X�*΍�4��l���K;��F~�ZwU"+�1M��v�͍�4uH��8�oj+G�N������` �#���Sln䷩�O�F�A4�	���57��ԛ�����OYτ��knܧ��cӍl�$!MH[�f�����#J��	V�J[�F��Ρ��L{�9j��a~��7�.�&�      +   �  x���[n�8E�ի�L�^$��0��cx�@q��\��3bK"���|U�E�-�ʒ�b\8���r�|�\)U����i&�~�==������@��[l��X#MƷĵ2e�i��+K0��:�F�Isdb�Zf҈4 ������w���y��y&�C$�|��S��BjL�(%�4��C|}y��v���� T�S,�3i=@� �v��>�iU��A�Sᙴzj�>Hļ�!B+瀀2�(�:o�ÿ�!����͕�YR�4�_%�t]G�3��B���@DzB	H�D�i�Ig�@Dva����g,���2����:��듈��]�DD��_ǳ�Rq�e�y����<F�=�/W�P,�f�W����;���<�8�e����J#�f� Ė)f^%�613H�e�a��X��|4�I���z�o�������L�-�dU���BR�2���+�����[nne�4�!���j]G\�m^eQ�[ՂB���<��7傔��}��W�f�o�k��ەH:�ؒ���4�
�_m}��Yz�G�*Y��0v%d�r]I��"vf���E���A��W"��䈈X�j�EO4����J�ؤ�D$I;ޔ���H3i�룲�5L8�TB�P4�3i��>v3��H-ͤ�Gd���fV���1��3i �M�/n03�P��iMT@t�p��p�ɡdv�4����?��__��/�_�ߞ��i#��[}����T��} �v�z��Sk�G��4��P5Z�=����|�����]��k�E���4��;���fwS@�->Q�m�y����8fh�<>���?>>�xY?���av+@�c�.��[�9�$0�3}�PLt�ڭ�8�Q�`%'�IɆ�mA8�Yk%��x&����Z�5Գe�_��Ӻ�n�s��P������E�� �o3i=���t�bq+�      -      x������ � �      ,      x������ � �         \  x�}�Ir����)t��MKY����
�ݵ�L��$���R���	p��K1?L9�����M]	ɫj�S��s#d6c2�=1�2^pi��8+.�����	�,u䆉܏�x����G�ӏIv'$����o�|ǁ���{�rsN��c艧"��$�����t��Pr��T��.�U'�f~Ҋ�x�LV���-_Re�2"���x5��f�g�����W~0��.��2*U�v���� �B��u�����AA�S����ʒtDܫ����\��V�Gi�^�k<�$m;�6&���X��<15�?hUb�K��P�K�J�B�5[�_5)�\Az�
��+��Ci��鐢�v�m�DŰ�Ƌ���S��&~8��A~��Л���#_,^�0h2q��������I�j�Y���h?������h((�i�	��q�U�����:ϝ^���ɒ��[z�?����窴�mN��?"W �N~��#/�и���AU1&�s�S�w G>�W��ٶ,?��Ȥ͉��_��ڈ7a�����8��e��_�=r�%� 
iɞ��*>��ŷp���("n��:���Yet�����r�WDOj�B�XҞ�o���h᭽��.d͏��=����Vי1:cR�����ץ�'��|$�@�2���\�$��:h����#L �Ɔx�m���(��4�9tB~�ǉ{ � >)kCr{vu��6EQ�ׂ~5ʙ~���(�͐V�lѝ��0�q	��ξq��ޡǧ��D]��m���8}r⚈ۢ�Յ��6{�����b�Zq��\��_*I_)�Ŝ8�g[P����E��6(66W_*Ëj ���y���+��J��Cm��n\�B˺T�Ąܫ�j.����w7��bI��Y�-�6d��ç�9ps%�-�$��֡��Q��ΆG@�!�Bun��T��y�,���S*u������m X�7ʿ��V���ʗV�����-w�
O88O�Ӗ�����z�G�2B���b��	w�$�=�L�Ra)
�:����o?�c9t�����k"+H���hDU�H����М���^�y���GqQ�9(3FU��t{�.�*ێ�BB`O$��t��;Ϡ���������$���ڤL�;ń9g�2�sr+^��ȳA��e�V�ti��oT�e���L�$4�웓=C�7��I��,��N�9C �k��u�>���������YG�7�;'	I�W�R1m�!'��V^�5��w=���	�1�VF�M֨K�S�,�٦��r�BRi��"KB�Pc����6��&,4�+{'����y����d��p�j���M�诡�Aus�k�&m�����?nP���H@H�%_a!a���E�oou�ݥ6	��o��>��I����Ʒ�(�lWE��{p���{�iS�o�$���Y�"�N���O�b̹�m+���fM�����8�&�[D#u߶��l��d�>4	�NJ4 ��$?�:���#����jdW�rۼ�C���v��z�
�q�z�жbZpͥ^4~���H��'�ׅ�%1���
<�����0�-���1 ��	��%�!�Q��/Tu M��%d��%ڋ�S�+�&3��� �%B��^CNc�B����(���y�i�]4��@W��.r�m�t�-l�G�LRq$���SM�,0+{j�f� |�4Oг��%@L�|����л綗0t��	�a�ٔeR��5

��G�A��j����@��n��2��5�7}4��y�g�qI\����pwp�	a���<�p(*j���r��4t|L$�L�m��;��� �Y��J������[�`���������Vqۇ�ۃLŇHi��G��;�BZ��1�h?�Y"ޡ���gFO/�g���t�H�@=��s�S��An�}�+>:�&L�Ht5=��6����)]<�TI5�>9�)At+@DD�S!�Y7�v�߽��n�M�+;�J(B/Mӗ����51WBc4�j��[V�����rI���ao+"�)W�>e=�(40������vԟ�/���_4��Q�h\R^`�kv+/Zdg�h�(@��=*4Mw&zD��ڽ�n/<g�$����#�(�a�.�d��;�	?��Q�'������c�R            x������ � �      1   )   x�3�4�4�2�&\Ɯ�@҄�HY@��6����� g��      5   (   x�343��4�44���2433 qL�C�ĉ���� ��P      /   c   x�-��
�0�ySP���a%*�l�M����0s���H��=^��JE�0�j����ʏ�]�s-����|Tó�}(��7J��>җ�> �H*      '   z  x���OO�0�s�)zԃd�;8!xЄ(G/u�Q]���ޙ��j[���{����D	zٷ���+r=zm*4m�O���y�[�i�myD>���}xf*�U��{��[�!8��s�k�i5�{�+]n� G<��.��ϭv���l��?ۻ�@�Vч�����n���z�%btH�>�4]�v]z�p�ٚ�tk*ۑq1��'O^9�R����l����o��k��Ϊm�	�4��Z�f	�<�����,V&Zl�h
&m%<�����"��l�f�D,�9���ٯ-��"�RhI�e��4�Q0�_�E�����LFm����x6�+���X@�X��
(�����0��f2�Dԏ�'{eY��d�            x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      3   �   x�]�m
� ���0cv�>.��j�
�E#c�_�\�ɓ���A�EB��N��"����,ݧ��6t��w��@�9 ��|�K�&D)�e����
�`)b(Iw؂�a���X�h����E0�9��ba^_2��r�w{f#����46Ա�Y	u�v!]_'���VuJ            x������ � �            x������ � �            x������ � �            x������ � �      "   $   x�3��J,�NT�-�,��+��,�/-����� �0�      #   �   x�m��n�  ��{�)��v/�K�>A/��l(,YH^=�R-��>,�1l�n��N���32N��_����װ�0hx��ᗆ�UըjUU�2j[F��re��~��X\Ck`Y�0[3��L.w��Q8_7�uºj�R��b]'�T�?{L�1�s/'z��+��<^z�HL�=�l �`R̸�i�H8>���_>�r��2�@.q��?������"      )   �   x���1n�0Eg��$ER����dI���@�ܿR�E�v����������#�+�lU�ڥ
#0Jm��j��;J5_-��r�V�*�ي�J؄vB_X�� ����4R�^�9�-x����5�C�^�zO Y�{�h6m�TBl���To�F�-#X��gUGOw)�4�m����K����v��7�O�C
�p��+���%|�
�_�i!��ES~,���m�1~m
�P     