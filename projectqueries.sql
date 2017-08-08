#Search a document by ID, title or publishername.
#SELECT DOCID FROM DOCUMENT WHERE DOCID = 'programming' or title = 'programming';
#SELECT TITLE FROM DOCUMENT WHERE TITLE = 'PROGRAMMING';
SELECT DOC.DOCID, DOC.TITLE, DOC.PDATE, PUB.PUBNAME FROM PUBLISHER AS PUB, DOCUMENT AS DOC WHERE PUB.PUBLISHERID = DOC.PUBLISHERID AND PUB.PUBNAME= 'PEARSON'
UNION
SELECT DOC.DOCID, DOC.TITLE, DOC.PDATE, PUB.PUBNAME FROM PUBLISHER AS PUB, DOCUMENT AS DOC WHERE DOCID = 'D2020' or title = 'PROGRAMMING';
#SELECT *  FROM PUBLISHER;
#SELECT * FROM DOCUMENT;


#Document checkout.
#DESCRIBE BORROWS;
select docid, libid,copyno from copy where docid = 'D2020';

#Document Return.
#SELECT DOCID, RDTIME FROM BORROWS WHERE DOCID='D2020';

#Document reserves.
#DESCRIBE RESERVES;
#DELETE FROM RESERVES;
#INSERT INTO RESERVES (READERID, DOCID, COPYNO, LIBID, DTIME) VALUES ('RED51', 'DB2026', 3, 'L1016', '2013-11-23 11:45:10');
#SELECT * FROM RESERVES;
#SELECT DOCID, DTIME FROM RESERVES WHERE DOCID='DB2026';

#Compute fine for a document copy borrowed by a reader based on the current date.
select readerid, case
     when  timestampdiff(day,BDTIME,now()) > 20
            THEN timestampdiff(day,RDTIME,now())  * .20
             ELSE 0
  END AS fine
       from borrows; 

#List of documents reserved by a reader and their status.
#SELECT READERID, RESNUMBER, DOCID, DTIME FROM RESERVES WHERE READERID = 'RED51'
#UNION
#SELECT READERID, BORNUMBER, DOCID, BDTIME FROM BORROWS WHERE READERID ='RED51';

#Print the document id and document titles of documents published by a publisher.
#SELECT D.DOCID, D.TITLE FROM DOCUMENT D, PUBLISHER P WHERE D.PUBLISHERID=P.PUBLISHERID AND P.PUBNAME='PEARSON';

#Add Document copy
#INSERT INTO DOCUMENT (DOCID, TITLE, PDATE, PUBLISHERID) VALUES ('DB2025', 'ENGLISH','2016-01-11','P1010');

#Search a Document and check its status.
#SELECT R.DOCID, R.RESNUMBER, R.READERID, R.DTIME FROM RESERVES R WHERE R.DOCID ='D2020' UNION SELECT B.DOCID, B.BORNUMBER, B.READERID, B.BDTIME FROM BORROWS B WHERE B.DOCID ='D2020';

#Add new reader.
#INSERT INTO READER (READERID, RTYPE,RNAME, ADDRESS) VALUES ('RED99','STAFF', 'ALEX', 'MUMBAI');

#Print top 10 most frequent borrowers in a branch and the number of books each has borrowed.
#select count(b.docid), b.readerid  from borrows b, book book where b.LIBID =  'L1011' and b.docid=book.docid  group by b.readerid order by count(b.docid) desc limit 10;

#Print top 10 most borrowed books in a branch.
#select  b.docid, count(b.readerid)  from borrows b, book book where b.LIBID =  'L1011' and book.docid = b.docid  group by b.docid order by count(b.readerid) desc limit 10;

#Print the 10 most popular books of the year.
#select  b.docid, count(b.readerid)  from borrows b, book book where book.docid = b.docid  group by b.docid order by count(b.readerid) desc limit 10;

SET FOREIGN_KEY_CHECKS=0;




 
#SELECT * FROM BORROWS;

 

#Print the document id and document titles of documents published by a publisher.
#SELECT D.DOCID, D.TITLE FROM DOCUMENT D, PUBLISHER P WHERE D.PUBLISHERID=P.PUBLISHERID AND P.PUBNAME='PEARSON';


#SELECT R.DOCID, B.DOCID, R.READERID, B.READERID as brdid, R.DTIME, B.BDTIME FROM RESERVES R ,  BORROWS B where B.DOCID= 'D2020' ;
#SELECT R.DOCID, R.RESNUMBER, R.READERID, R.DTIME FROM RESERVES R WHERE R.DOCID= 'D2020' UNION SELECT B.DOCID, B.BORNUMBER, B.READERID, B.BDTIME FROM BORROWS B WHERE B.DOCID= 'D2020';



#select timestampdiff(day,B.RDTIME,now()) from borrows b;


#select T.readerid,avg(T.fine)  from (select readerid,case when  timestampdiff(day,BDTIME,now()) > 20 THEN timestampdiff(day,RDTIME,now())  * .20 ELSE 0 END AS fine  from borrows ) As T  group by T.readerid;
#IF ( SELECT (BDTIME-RDTIME) FROM BORROWS > 20)

# IF(BDTIME-RDTIME)>20 FINE=(BDTIME-RDTIME)*0.20 eLSE FINE=0

#IF ((SELECT COUNT(*) FROM table1 WHERE project = 1) > 0) 

#3select count(b.docid) as doccount, b.readerid  from borrows b, book book where b.LIBID =  'L1011' and b.docid=book.docid  group by b.readerid order by count(b.docid) desc limit 10

#SELECT DOC.DOCID, DOC.TITLE, DOC.PDATE, PUB.PUBNAME FROM PUBLISHER AS PUB, DOCUMENT AS DOC WHERE PUB.PUBLISHERID = DOC.PUBLISHERID AND PUB.PUBNAME= 'PEARSON'
#UNION
#SELECT DOC.DOCID, DOC.TITLE, DOC.PDATE, PUB.PUBNAME FROM PUBLISHER AS PUB, DOCUMENT AS DOC WHERE DOCID = 'D2020' or title = 'PROGRAMMING';

#SELECT DOC.DOCID, DOC.TITLE,DOC.PDATE, PUB.PUBNAME FROM PUBLISHER AS PUB, DOCUMENT AS DOC WHERE PUB.PUBLISHERID = DOC.PUBLISHERID AND PUB.PUBNAME= 'D2020';
#SELECT * FROM document;