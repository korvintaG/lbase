delete from source where not id in (select source_id from tmp_filter_source union all select project_id from tmp_filter_project);
delete from author where not exists (select * from source_author, source  where author.id=source_author.author_id and source_id=source.id);
delete from note where not exists (select * from note_source, source where note_id=note.id and source_id=source.id);
delete from note_attach where not exists (select * from note where id=note_attach.note_id);
delete from note_keyword where not exists (select * from note where id=note_keyword.note_id);
delete from note_link where not exists (select * from note where id=note_link.note1_id) or not exists (select * from note where id=note_link.note2_id);
delete from note_source where not exists (select * from note where id=note_source.note_id) or not exists (select * from source where id=note_source.source_id);
delete from note_structure_item where not exists (select * from note where id=note_structure_item.note_id);
delete from note_url where not exists (select * from note where id=note_url.note_id);
delete from keyword where id not in (select keyword_id from tmp_filter_keyword_out);
delete from source_attach; -- удалить чтоб текстов книг не было в демо
delete from source_author where not exists (select * from author where author_id=author.id) or not exists (select * from source where source_id=source.id);
delete from source_url where not exists (select * from source where source_id=source.id);
delete from source_structure_item where not exists (select * from source where source_id=source.id);
delete from structure_item where not exists (select * from note_structure_item where structure_item_id=structure_item.id);
delete from interest where not id in (select interest_id from tmp_filter_interest_out);
delete from interest_keyword where keyword_id not in (select id from keyword);
delete from interest_keyword where interest_id not in (select id from interest);
delete from keyword_structure_item;
delete from source_keyword where source_id not in (select id from source) or keyword_id not in (select id from keyword);
delete from source_toc where source_id not in (select id from source);
delete from parameter;
delete from telegram_fast_note;
insert into parameter (name,int_value) select 'Mode', 0;
delete from keyword_name where keyword_id not in (select id from keyword);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from source_classification where 
  not exists (select * from source where source.source_classification_id=source_classification.id)
  and not exists (select * from source_classification sc where sc.source_classification_id=source_classification.id);
delete from task;
delete from task_keyword;
delete from task_source;
delete from note_attach;
delete from note_url where url like '%yandex%';
delete from source_url where url like '%yandex%';
delete from stoc_keyword where not exists (select * from source_toc where source_toc.id=stoc_keyword.stoc_id) or not exists (select * from keyword where keyword.id=stoc_keyword.keyword_id);
--commit;
--VACUUM;
