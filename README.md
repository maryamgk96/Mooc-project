# README

* Ruby version->  5.1.6

* Database creation
  1)change your database configaration for mysql in database.yml
  2)rails db:migrate
  3)rake db:seed

*Notes:
1)user can register as a normal user or an instructor.
2)normal user can view courses and lectures, like , comment and mark as spam lectures.

3) instructor can do what normal user do in addition to being able to CRUD on only the courses he
created and CRUD on lectures which belongs to courses he created.

4)unregistered user can only view lectures and courses
