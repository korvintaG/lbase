BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "source_author" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"author_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("source_id","author_id")
);
CREATE TABLE IF NOT EXISTS "link_type" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"corr_link_type"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "author" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"notes"	TEXT,
	"date_time_create"	DATETIME,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_link" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note1_id"	INTEGER NOT NULL,
	"note2_id"	INTEGER NOT NULL,
	"link_type"	INTEGER NOT NULL DEFAULT 0,
	"date_time_create"	DATETIME,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "source_toc" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"stoc_id"	INTEGER,
	"order_"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_stoc" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"order_"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("order_" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_attach" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filename"	TEXT NOT NULL,
	"content"	BLOB,
	"note_id"	INTEGER NOT NULL,
	"file_size"	INTEGER,
	"comment"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "source_attach" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filename"	TEXT NOT NULL,
	"content"	BLOB,
	"source_id"	INTEGER NOT NULL,
	"file_size"	INTEGER,
	"comment"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "structure_item" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("name")
);
CREATE TABLE IF NOT EXISTS "note_structure_item" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"structure_item_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("note_id","structure_item_id")
);
CREATE TABLE IF NOT EXISTS "keyword_structure_item" (
	"id"	INTEGER NOT NULL UNIQUE,
	"keyword_id"	INTEGER NOT NULL,
	"structure_item_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("keyword_id","structure_item_id")
);
CREATE TABLE IF NOT EXISTS "source_structure_item" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"structure_item_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "ssi_uni" UNIQUE("source_id","structure_item_id")
);
CREATE TABLE IF NOT EXISTS "source_type" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"cr_type"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_source" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"source_id"	INTEGER NOT NULL,
	"stoc_id"	INTEGER,
	"Page_from"	REAL,
	"Page_to"	REAL,
	"order_"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("note_id","source_id","stoc_id")
);
CREATE TABLE IF NOT EXISTS "note_url" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"url"	TEXT NOT NULL,
	"comment"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("url")
);
CREATE TABLE IF NOT EXISTS "source_url" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"url"	TEXT NOT NULL,
	"comment"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("url")
);
CREATE TABLE IF NOT EXISTS "keyword_class" (
	"id"	INTEGER NOT NULL UNIQUE,
	"keyword_id"	INTEGER NOT NULL,
	"class_keyword_id"	INTEGER NOT NULL,
	UNIQUE("keyword_id","class_keyword_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "source_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"keyword_name_id"	integer,
	UNIQUE("source_id","keyword_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "keyword_theme_1" (
	"id"	INTEGER NOT NULL UNIQUE,
	"keyword_id"	INTEGER NOT NULL,
	"theme_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("keyword_id","theme_id")
);
CREATE TABLE IF NOT EXISTS "source_theme_1" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"theme_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("source_id","theme_id")
);
CREATE TABLE IF NOT EXISTS "project_toc" (
	"id"	INTEGER NOT NULL UNIQUE,
	"project_id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"ptoc_id"	INTEGER,
	"order_"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_project" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"project_id"	INTEGER NOT NULL,
	"ptoc_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("note_id","project_id","ptoc_id")
);
CREATE TABLE IF NOT EXISTS "source" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"notes"	TEXT,
	"source_type_id"	INTEGER,
	"date_time_create"	DATETIME,
	"note_show_mode"	INTEGER NOT NULL DEFAULT 3,
	"status"	INTEGER NOT NULL DEFAULT 0,
	"cur_stoc_id"	INTEGER,
	"is_mine"	INTEGER NOT NULL DEFAULT 0,
	"source_classification_id"	integer DEFAULT 0,
	"telegram_message_id"	TEXT,
	"date_time_update"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "source_toc_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"stoc_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"order_"	INTEGER NOT NULL DEFAULT 0,
	UNIQUE("stoc_id","keyword_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "interest" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"class_interest_id"	INTEGER NOT NULL DEFAULT 0,
	"date_time_create"	DATETIME,
	"order_"	integer,
	UNIQUE("name"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "interest_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"interest_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"order_"	INTEGER,
	UNIQUE("interest_id","keyword_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_kw_id" (
	"id"	INTEGER
);
CREATE TABLE IF NOT EXISTS "tmp_int_kw" (
	"int_id"	INTEGER,
	"kw_id"	INTEGER,
	"int_order"	INTEGER,
	"kw_order"	INTEGER
);
CREATE TABLE IF NOT EXISTS "filter_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filter_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("filter_id","keyword_id")
);
CREATE TABLE IF NOT EXISTS "filter" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"area_type"	INTEGER NOT NULL,
	"use_type"	INTEGER NOT NULL DEFAULT 0,
	"date_time_create"	DATETIME,
	"is_active"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_filter_keyword" (
	"keyword_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("keyword_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_author" (
	"author_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("author_id")
);
CREATE TABLE IF NOT EXISTS "filter_author" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filter_id"	INTEGER NOT NULL,
	"author_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("filter_id","author_id")
);
CREATE TABLE IF NOT EXISTS "filter_source" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filter_id"	INTEGER NOT NULL,
	"source_id"	INTEGER NOT NULL,
	UNIQUE("filter_id","source_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_filter_source" (
	"source_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("source_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_keyword_out" (
	"keyword_id"	INTEGER NOT NULL UNIQUE,
	"type_"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("keyword_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_interest" (
	"interest_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("interest_id")
);
CREATE TABLE IF NOT EXISTS "filter_interest" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filter_id"	INTEGER NOT NULL,
	"interest_id"	INTEGER,
	UNIQUE("filter_id","interest_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "filter_project" (
	"id"	INTEGER NOT NULL UNIQUE,
	"filter_id"	INTEGER NOT NULL,
	"project_id"	INTEGER NOT NULL,
	UNIQUE("filter_id","project_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_filter_project" (
	"project_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("project_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_interest_out" (
	"interest_id"	INTEGER NOT NULL UNIQUE,
	"type_"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("interest_id")
);
CREATE TABLE IF NOT EXISTS "interest_keyword_expand" (
	"interest_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	UNIQUE("interest_id","keyword_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_keyword_not" (
	"keyword_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("keyword_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_interest_not" (
	"interest_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("interest_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_note_add_source" (
	"source_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("source_id")
);
CREATE TABLE IF NOT EXISTS "tmp_filter_source_and_project" (
	"sp_id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("sp_id")
);
CREATE TABLE IF NOT EXISTS "keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name_main"	TEXT NOT NULL,
	"date_time_create"	DATETIME,
	"class_keyword_id"	INTEGER NOT NULL DEFAULT 0 CHECK("class_keyword_id" <> "id"),
	"order_"	integer,
	"date_time_update"	DATETIME,
	"class_name_before"	TEXT,
	"class_name_after"	TEXT,
	"name_w_synonym"	TEXT,
	"note"	TEXT,
	"all_use_count"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("name_main","class_keyword_id")
);
CREATE TABLE IF NOT EXISTS "keyword_name" (
	"id"	INTEGER NOT NULL UNIQUE,
	"keyword_id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"order_"	INTEGER,
	"note"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL CHECK(ifnull("keyword_id", 0) > 0),
	"keyword_name_id"	integer NOT NULL,
	UNIQUE("note_id","keyword_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "source_classification" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_classification_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"is_mine"	INTEGER NOT NULL DEFAULT 0,
	"date_time_create"	DATETIME,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_left_sources" (
	"source_classification_id"	INTEGER NOT NULL,
	"id"	INTEGER NOT NULL,
	"is_dir"	INTEGER NOT NULL,
	"is_mine"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"themes"	TEXT,
	"source_type_id"	INTEGER,
	"status"	INTEGER,
	"name"	TEXT
);
CREATE TABLE IF NOT EXISTS "tmp_right_sources" (
	"source_classification_id"	INTEGER NOT NULL,
	"id"	INTEGER NOT NULL,
	"is_dir"	INTEGER NOT NULL,
	"is_mine"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"themes"	TEXT,
	"source_type_id"	INTEGER,
	"status"	INTEGER,
	"name"	TEXT
);
CREATE TABLE IF NOT EXISTS "tmp_left_projects" (
	"source_classification_id"	INTEGER NOT NULL,
	"id"	INTEGER NOT NULL,
	"is_dir"	INTEGER NOT NULL,
	"is_mine"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"themes"	TEXT,
	"source_type_id"	INTEGER,
	"status"	INTEGER,
	"name"	TEXT
);
CREATE TABLE IF NOT EXISTS "tmp_right_projects" (
	"source_classification_id"	INTEGER NOT NULL,
	"id"	INTEGER NOT NULL,
	"is_dir"	INTEGER NOT NULL,
	"is_mine"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"themes"	TEXT,
	"source_type_id"	INTEGER,
	"status"	INTEGER,
	"name"	TEXT
);
CREATE TABLE IF NOT EXISTS "tmp_source_classification" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"order_"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_project_classification" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"order_"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_left_keyword" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT,
	"class_keyword_id"	INTEGER,
	"date_time_create"	DATETIME,
	"order_"	INTEGER,
	"is_dir"	INTEGER,
	"type_"	INTEGER,
	"note_cnt"	INTEGER,
	"subfolder_cnt"	INTEGER,
	"class_name_after"	TEXT,
	"source_cnt"	integer,
	"def"	TEXT,
	"interest_count"	integer,
	"class_name_before"	TEXT
);
CREATE TABLE IF NOT EXISTS "tmp_right_keyword" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT,
	"class_keyword_id"	INTEGER,
	"date_time_create"	DATETIME,
	"order_"	INTEGER,
	"is_dir"	INTEGER,
	"type_"	INTEGER,
	"note_cnt"	INTEGER,
	"subfolder_cnt"	INTEGER,
	"class_name_after"	TEXT,
	"source_cnt"	integer,
	"def"	TEXT,
	"interest_count"	integer,
	"class_name_before"	TEXT
);
CREATE TABLE IF NOT EXISTS "keyword_link2" (
	"id"	INTEGER NOT NULL UNIQUE,
	"link_type"	INTEGER NOT NULL,
	"keyword1_id"	INTEGER NOT NULL,
	"keyword2_id"	INTEGER NOT NULL,
	PRIMARY KEY('id' AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "telegram_fast_note" (
	"id"	INTEGER NOT NULL UNIQUE,
	"telegram_message_id"	INTEGER NOT NULL,
	"text"	TEXT,
	"status"	INTEGER DEFAULT 0,
	"file_unique_id"	TEXT,
	"file_remote_id"	TEXT,
	"file_session_id"	INTEGER,
	"file"	BLOB,
	"local_file_name"	TEXT,
	"date_time_create"	DATETIME,
	"web_page_url"	TEXT,
	"web_page_type"	TEXT,
	"web_page_title"	TEXT,
	"file_ext"	TEXT,
	"message_type"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tmp_KW_notes" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tmp_KW_Analyze_Exclude" (
	"id"	INTEGER NOT NULL UNIQUE,
	"order_"	INTEGER,
	"kw_name_id"	INTEGER NOT NULL UNIQUE,
	"kw_id"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tmp_KW_Analyze_MayBe" (
	"id"	INTEGER NOT NULL UNIQUE,
	"order_"	INTEGER,
	"kw_name_id"	INTEGER NOT NULL UNIQUE,
	"kw_id"	INTEGER NOT NULL,
	"note_cnt"	integer,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tmp_KW_Analyze_Obligatory" (
	"id"	INTEGER NOT NULL UNIQUE,
	"order_"	INTEGER,
	"kw_name_id"	INTEGER NOT NULL UNIQUE,
	"kw_id"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tmp_KW_Analyze_Related" (
	"id"	INTEGER NOT NULL UNIQUE,
	"order_"	INTEGER,
	"kw_name_id"	INTEGER NOT NULL UNIQUE,
	"kw_id"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "note" (
	"id"	INTEGER NOT NULL UNIQUE,
	"subpart_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"original_text"	TEXT,
	"content"	TEXT NOT NULL,
	"content_plain"	TEXT,
	"date_time_create"	DATETIME,
	"fast_text"	TEXT,
	"note_show_mode"	INTEGER NOT NULL DEFAULT 3,
	"splitter_param"	INTEGER DEFAULT 0,
	"h_splitter_param"	INTEGER DEFAULT 0,
	"date_time_update"	DATETIME,
	"form_width"	integer DEFAULT 840,
	"telegram_message_id"	TEXT,
	"content_html"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "parameter" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"int_value"	INTEGER,
	"str_value"	TEXT,
	"date_time_update"	DATETIME,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "stoc_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"source_id"	INTEGER NOT NULL,
	"stoc_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"keyword_name_id"	integer,
	UNIQUE('stoc_id','keyword_id'),
	PRIMARY KEY('id' AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_source_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"keyword_name_id"	integer NOT NULL,
	"source_id"	INTEGER NOT NULL,
	PRIMARY KEY('id' AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "note_expanded_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"note_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"keyword_name_id"	integer NOT NULL,
	"type_"	INTEGER NOT NULL DEFAULT 0,
	"parent_id"	INTEGER NOT NULL,
	PRIMARY KEY('id' AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "task" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"content"	TEXT NOT NULL,
	"type_"	INTEGER NOT NULL DEFAULT 0,
	"deadline"	DATETIME,
	"date_time_create"	DATETIME,
	"status"	INTEGER NOT NULL DEFAULT 0,
	"date_time_close"	DATETIME,
	"task_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "task_keyword" (
	"id"	INTEGER NOT NULL UNIQUE,
	"task_id"	INTEGER NOT NULL,
	"keyword_id"	INTEGER NOT NULL,
	"keyword_name_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "task_source" (
	"id"	INTEGER NOT NULL UNIQUE,
	"task_id"	INTEGER NOT NULL,
	"source_id"	INTEGER NOT NULL,
	"stoc_id"	INTEGER,
	"is_mine"	INTEGER NOT NULL DEFAULT 1,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_left_keyword_cont" (
	"id"	INTEGER NOT NULL UNIQUE,
	"type_"	INTEGER NOT NULL,
	"cont_id"	INTEGER NOT NULL,
	"name"	TEXT,
	"content"	TEXT,
	"source_type"	INTEGER,
	"subtype"	INTEGER,
	"attach_cnt"	INTEGER,
	"url_cnt"	INTEGER,
	"link_cnt"	INTEGER,
	"subname"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tmp_right_keyword_cont" (
	"id"	INTEGER NOT NULL UNIQUE,
	"type_"	INTEGER NOT NULL,
	"cont_id"	INTEGER NOT NULL,
	"name"	TEXT,
	"content"	TEXT,
	"source_type"	INTEGER,
	"subtype"	INTEGER,
	"attach_cnt"	INTEGER,
	"url_cnt"	INTEGER,
	"link_cnt"	INTEGER,
	"subname"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE INDEX IF NOT EXISTS "ns_stoc" ON "note_source" (
	"stoc_id"
);
CREATE INDEX IF NOT EXISTS "st_source" ON "source_toc" (
	"source_id"
);
CREATE INDEX IF NOT EXISTS "fkw_uni" ON "filter_keyword" (
	"filter_id",
	"keyword_id"
);
CREATE INDEX IF NOT EXISTS "kw_class" ON "keyword" (
	"class_keyword_id"
);
CREATE INDEX IF NOT EXISTS "kwn_kwid" ON "keyword_name" (
	"keyword_id"
);
CREATE INDEX IF NOT EXISTS "nkw_uni" ON "note_keyword" (
	"keyword_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "note_link_uni" ON "note_link" (
	"note1_id",
	"note2_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "kw_name_uni" ON "keyword_name" (
	'keyword_id',
	'name'
);
CREATE UNIQUE INDEX IF NOT EXISTS "kw_main_uni" ON "keyword" (
	'class_keyword_id',
	'name_main'
);
CREATE INDEX IF NOT EXISTS "nekw_keyword_id" ON "note_expanded_keyword" (
	'keyword_id'
);
CREATE INDEX IF NOT EXISTS "note_kw_keyword_id" ON "note_keyword" (
	'keyword_id'
);
CREATE INDEX IF NOT EXISTS "note_attach_note_id" ON "note_attach" (
	'note_id'
);
CREATE INDEX IF NOT EXISTS "note_url_note_id" ON "note_url" (
	'note_id'
);
CREATE INDEX IF NOT EXISTS "note_ekw_keyword_id" ON "note_expanded_keyword" (
	'keyword_id'
);
COMMIT;
