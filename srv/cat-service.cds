using my.bookshop as my from '../db/data-model';

service CatalogService {

  @readonly entity Books as SELECT from my.Books { *,
    author.name as author
  } excluding { createdBy, modifiedBy };

  @requires: 'authenticated-user'
  entity Orders @( odata.draft.enabled : true  )
  as projection on my.Orders;

}