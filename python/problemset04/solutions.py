problemset04 10th sep 2018
submission by sai.akhila.potluri@accenturee.com

1)Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument. Both classes have a area function which can print the area of the shape where Shape's area is 0 by default.
class shapes:
    def area(self,a=0):
        print("area of shape:",a)
class square:
    def __init__(self,l):
        self.l = l
        self.area()
    def area(self):
        area=self.l*self.l
        print("area of square:",area)
ob1=shapes()
ob1.area()
ob2=square(5)


2)Define a class Person and its two child classes: Male and Female. All classes have a method "getGender" which can print "Male" for Male class and "Female" for Female class.
class person:
    def getgender(self):
        pass
class male:
    def getgender(self):
        print("male")
class female:
    def getgender(self):
        print("female")

ob1=male()
ob1.getgender()
ob2=female()
ob2.getgender()

3)Design and implement a Money class that stores monetary values in dollars and cents. Special method init should have the following function header, def init(self, dollars, cents) Include special method repr (str) for displaying values in dollars and cents: $ 0.45, $ 1.00, $ 1.25. Also include special method add, and three getter methods that each provide the monetary value in another currency. Choose any three currencies to convert to.
class money:
    def __init__(self,dollars,cents):
        self.dollars=dollars
        self.cents=cents
    def repr(self):
        if int(self.cents)<=99:
            s=(self.dollars,self.cents)
            self.value=float(".".join(s))
            print("the currency is $",self.value)
        else:
            c = float(self.cents) / 100
            self.value = float(self.dollars) + c
            print("The currency is $", self.value)

    def rupees(self):
            rupval=self.value*72.42
            print("the value in rupees:",rupval)
    def euro(self):
            euroval=self.value*0.87
            print("the value in euro",euroval)
    def riyal(self):
            riyval=self.value*3.75
            print("the value in riyal:",riyval)
a=input("enter dollar value")
b=input("enter cent value")
ob=money(a,b)
ob.repr()
ob.rupees()
ob.euro()
ob.riyal()



