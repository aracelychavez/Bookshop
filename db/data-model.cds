namespace my.bookshop;
using { Country, cuid, managed } from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : cuid, managed {
  book    : Association to Books;
  amount  : Integer;
}