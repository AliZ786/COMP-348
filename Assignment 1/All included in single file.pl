team(['40029586,40077619']).
student_info('40029586', 'Brinda', 'Rebekah').
student_info('40077619', 'Mohammad Ali', 'Zahir').
takes_course('40029586', 'comp', '348', 'aa').
takes_course('40029586', 'comp', '348', 'aaae').
takes_course('40077619', 'comp', '348', 'ab').
takes_course('40077619', 'comp', '348', 'abae').
takes_course('40077619', 'encs', '282', 'ab').
takes_course('40077619', 'encs', '282', 'abai').
takes_course('40077619', 'engr', '392', 'cc').
takes_course('40077619', 'comp', '371', 'dd').
takes_course('40077619', 'comp', '371', 'dddj').
takes_course('40077619', 'soen', '287', 'cc').
takes_course('40077619', 'soen', '287', 'ccce').
course_schedule('comp', '348', 'aa', 'mon', '1445', '1715').
course_schedule('comp', '348', 'aa', 'wed', '1445', '1715').
course_schedule('comp', '348', 'aaae', 'mon', '1345', '1405').
course_schedule('comp', '348', 'aaae', 'wed', '1345', '1405').
course_schedule('comp', '348', 'ab', 'tue', '1315', '1545').
course_schedule('comp', '348', 'ab', 'thu', '1315', '1545').
course_schedule('comp', '348', 'abaf', 'tue', '1615', '1705').
course_schedule('comp', '348', 'abaf', 'thu', '1615', '1705').
course_schedule('comp', '346', 'cc', 'tue', '1830', '2100').
course_schedule('comp', '346', 'cc', 'thu', '1830', '2100').
course_schedule('comp', '348', 'ab', 'tue', '1315', '1545').
course_schedule('comp', '348', 'ab', 'thu', '1315', '1545').
course_schedule('comp', '348', 'abae', 'tue', '1615', '1705').
course_schedule('comp', '348', 'abae', 'thu', '1615', '1705').
course_schedule('encs', '282', 'ab', 'tue', '1015', '1245').
course_schedule('encs', '282', 'ab', 'thu', '1015', '1245').
course_schedule('encs', '282', 'abai', 'tue', '0830', '1010').
course_schedule('encs', '282', 'abai', 'thu', '0830', '1010').
course_schedule('engr', '392', 'cc', 'tue', '0845', '1130').
course_schedule('engr', '392', 'cc', 'thu', '0845', '1130').
course_schedule('comp', '371', 'dd', 'tue', '1145', '1315').
course_schedule('comp', '371', 'dd', 'thu', '1145', '1315').
course_schedule('comp', '371', 'dddj', 'tue', '1335', '1525').
course_schedule('comp', '371', 'dddj', 'thu', '1335', '1525').
course_schedule('soen', '287', 'cc', 'mon', '1145', '1415').
course_schedule('soen', '287', 'cc', 'wed', '1145', '1415').
course_schedule('soen', '287', 'ccce', 'mon', '0845', '1125').
course_schedule('soen', '287', 'ccce', 'wed', '0845', '1125').


all_sections(CNAM, CNUM, L) :- 

findall(X, takes_course(_, CNAM, CNUM, X), L),

write(L).

/* L contains a list of all sections of course CNAME, CNUM,
i.e. calling all_sections('comp', '348', L) will result in L=['aa', 'ab'];
     no duplicates */
	 
has_taken(S, [CNAM|[CNUM|[SEC|[]]]]) :- 

/* true if student S takes the course CNAM CNUM SEC,
   e.g. takes('4000123', ['comp', '348', 'aa']) */
   
team(X), member(S, X),takes_course(S, CNAM, CNUM, SEC).


has_taken2(S, [CNAM|[CNUM|[]]]) :- 
/* true if S takes any sections of the course CNAM CNUM,
   e.g. takes('4000123', ['comp', '348']) */
   team(X), member(S, X),takes_course(S, CNAM, CNUM, _).
	
all_subjects(S, L) :- 
/* L contains all the subjects that have been
taken by student S, i.e. ['comp', 'soen']; no duplicates */
setof(X, takes_course(S, X, _, _), L),

write(L).

all_courses(S, L) :- 
/* L contains all the corses that have been taken by
   student S, i.e. all_courses('4000123', L) will result in
   L=[['comp', '348', 'aa'], ['comp', '348', 'ab']] */

setof(X-Y-Z, takes_course(S, X, Y, Z), L),

write(L).

all_courses2(S, L) :- 
/* similar to all_courses but without section info;
   no duplicates */

setof(X-Y, takes_course(S, X, Y, _), L),

write(L).