day1and2 4th sep 2018
submission by sai.akhila.potluri@accenture.com


1)get first name and last name from user and print your full name 
a=raw_input("enter first name");
b=raw_input("enter second name")
print("name is %s%s"%(a,b))

2) get ur full name, age as input from user and print first name and last name , age using string slicing
i) 2 raw_input get name  and age 
ii) print first name and last name and age 
iii) WHEN age >= 18 , he/she is eligible to vote
iv) WHEN age < 18 , he/she is not eligible to vote
i)a=raw_input("enter name")
b=raw_input("enter age")
b=int(b)
print(a)
print(b)
ii)a=raw_input("enter firstname")
b=raw_input("enter lastname")
c=raw_input("enter age")
c=int(c)
print(a)
print(b)
print(c)
iii)iv)if(b>18):
    print("eligible")
else:
    print("not eligible")
output:enter name akhila
enter age 22
 akhila
22
eligible"""

3)Calculating your birth number in numerology
26/11/1978
2+6+1+1+1+7+8 = 8
a=raw_input("enter the dob")
sum=0
b=a.split("/")
c=map(int,b)
d=sum(c)
 while(d>0):
  dig=d%10
  sum=sum+dig
  d=d/10
print(sum)
  

4) Write a Python program to perform sum of three given integers. 
       However, if any of the two values are equal then sum will be zero (eg : 2+1+1 = 0)
a=raw_input("enter the value of a");
b=raw_input("enter the value of b");
c=raw_input("enter the value of c");
a=int(a)
b=int(b)
c=int(c)
if a==b:
  print("sum is 0")
elif a==c:
  print("sum is 0")
elif b==c:
  print("sum is 0")
else:
  print("sum is %s"%(a+b+c))


5) Write a Python program to check whether a year is leap year or not
a=raw_input("enter the value")
a=int(a)
if(a%4==0) and ((a%400==0) or (a%100!=0)):
    print("leap year")
else:
    print("not a leap year")


6)
Write a program that accepts a sentence and calculate the number of upper case letters and lower case letters.

Suppose the following input is supplied to the program:

Hello world!

Then, the output should be:

UPPER CASE 1

LOWER CASE 9
uc=0
lc=0
a=raw_input("enter the sentence")
for i in a:
  if (i.isupper()):
   uc=uc+1
  elif (i.islower()):
   lc=lc+1
print("upper case is %s"%uc)
print("lower case is %s"%lc)
enter the sentenceHello world
upper case is 1
lower case is 9

7)  write a python script to validate the strong password (combination of characters alphabets and numbers,special characters in it. if not weak password)
eg: Acc9876$
it is strong password
abcd
it is weak password
a=raw_input("enter the password")
al=0
n=0
special="!@#$5^7*"
if(length(password))>=1



8) declare a list containing numbers
    a) get only even numbers
    b) perform sum of those even numbers
b=[]
a=range(20)
for i in a:
 if(i%2==0):
   b.append(i)
print(b)
print("sum of even no is %s"%sum(b))


9) Write a program which accepts a sequence of comma-separated numbers from console and generate a list and a tuple which 
contains every number.

Suppose the following input is supplied to the program:
34,67,55,33,12,98


Then, the output should be:
['34', '67', '55', '33', '12', '98']
('34', '67', '55', '33', '12', '98')

num=raw_input("enter number")
a=list(num)
b=tuple(num)
print(a)
print(b)
