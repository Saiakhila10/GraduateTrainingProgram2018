day3 4th sep 2018
submission by sai.akhila.potluri@accenture.com


a)Given the following dictionary:
      inventory = {
                   'gold' : 500,
                   'pouch' : ['flint', 'twine', 'gemstone'],
                   'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
                }
       Try to do the followings:
       i)Add a key to inventory called 'pocket'.
       ii)Set the value of 'pocket' to be a list consisting of the strings 'seashell', 'strange berry', and 'lint'.
       iii).sort()the items in the list stored under the 'backpack' key.
       iv)Then .remove('dagger') from the list of items stored under the 'backpack' key.
       v)Add 50 to the number stored under the 'gold' key.

inventory={'gold':500,'pouch':['flint','twine','gemstone'],'backpack':['xylophone','dagger','bedroll','bread loaf']}
inventory['pocket']=[]
inventory['pocket'].extend(['seashell','strange berry','lint'])
inventory['backpack'].sort()
inventory['backpack'].remove('dagger')
inventory['gold']=[]
inventory['gold'].extend([50,500])
print(inventory)


b) create a student details dictionary having {'student1':[marks1,marks2, marks3],'student2':[marks1,marks2,marks3]}
       i)Create the dictionary as mentioned above
       ii) need to perform total and average of the marks for each student

d={}
stud_count=raw_input("enter no of student count")
for i in range(int(stud_count)):
  stud_name=raw_input("enter student name")
  sub_count=raw_input("enter sub count")
  mark_list=[]
  for j in range(int(sub_count)):
   #j=j+1
   marks=int(raw_input("enter marks for subject"))                                                                                                                                                          "))
   mark_list.append(marks)
   
  d[stud_name]=mark_list
print(d)
for k in student_details.iterkeys():
 summ=sum(student_details[k])
 length=len(student_details[k])
 avg=summ/length
 print(summ,avg)
