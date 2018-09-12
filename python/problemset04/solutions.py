problemset04 10th sep 2018
submission by sai.akhila.potluri@accenture.com

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

6)Develop an abstract class named Temperature that stores a single temperature. The class should have the following function header for special method init,
def __init__(self, temperature)
	'''The abstract class should contain the following methods:
	_str__ — should return a string of the form “75 degrees Fahrenheit”
	aboveFreezing() — returns True if temperature above the freezing point
	convertToFahren — returns a new Temperature object converted to degrees Fahrenheit
	convertToCelsius — returns a new Temperature object converted to degrees Celsius
	convertToKelvin — returns a new Temperature object converted to degrees Kelvin	
	'''Develop the subclasses Fahrenheit, Celsius and Kelvin to appropriately implement each of the methods in the abstract Temperature class. (Note that when a meaningless conversion method is applied, for example, temp1.convertToFahrenheit() where temp1 is an object of type Fahrenheit, then a copy of the Temperature object should be returned.)
Demonstrate the correctness of your classes by doing the following:
Create a list of Temperature objects of a mix of Temperature types
Print out the value of each temperature in the list, and add “above freezing” if the temperature is above freezing (for the specifi c temperature scale).
Create a new list of temperatures containing each temperature of the original list converted to a common temperature scale (Fahrenheit, Celsius, or Kelvin).
For each temperature object in the new list, print out its temperature value, and if it is above the freezing point.

class temperature:
    def __init__(self,temperature):
        pass
    def __str__(self):
        pass
    def abovefreezing(self):
        pass
    def converttofarenhiet(self):
        pass
    def converttocelsius(self):
        pass
    def converttokelvin(self):
        pass
class farenhiet(temperature):
    def __init__(self,temperature):
        self.degree=temperature
    def __str__(self):
        return self.degree,"degrees farenhiet"
    def abovefreezing(self):
        if(self.degree>32):
           return "true"
        else:
            return "false"
    def converttocelsius(self):
        return (self.degree-32)*(5/9)
    def converttokelvin(self):
        return (self.degree+459.67)*(5/9)
class celsius(temperature):
    def __init__(self,temperature):
        self.degree=temperature
    def __str__(self):
        return self.degree,"degrees celsius"
    def abovefreezing(self):
        if(self.degree>0):
            return "true"
        else:
            return "false"
    def converttofarenhiet(self):
        return (self.degree*(9/5))+32
    def converttokelvin(self):
        return self.degree+273.15
class kelvin(temperature):
    def __init__(self,temperature):
        self.degree=temperature
    def __str__(self):
        return self.degree,"degrees kelvin"
    def abovefreezing(self):
        if (self.degree>273.15):
            return "true"
        else:
            return "false"
    def converttocelsius(self):
        return self.degree - 273.15
    def converttofarenhiet(self):
        return (self.degree * (9/5)) - 459.67
f=float(input("enter the temperature in farenhiet"))
c=float(input("enter the temperature in celcius"))
k=float(input("enter the temperature in kelvin"))
o1=farenhiet(f)
o2=celsius(c)
o3=kelvin(k)
print(o1.__str__())
print(o2.__str__())
print(o3.__str__())
print("is farenhiet above freezing ",o1.abovefreezing())
print("is celcius above freezing ",o2.abovefreezing())
print("is kelvin above freezing ",o3.abovefreezing())
print( "farenheit in celsius ",o1.converttocelsius())
print("farenheit in kelvin ",o1.converttokelvin())
print("celsius in farenheit",o2.converttofarenhiet())
print("celcius in kelvin ",o2.converttokelvin())
print("kelvin in farenheit ",o3.converttofarenhiet())
print("kelvin in celcius",o3.converttocelsius())




