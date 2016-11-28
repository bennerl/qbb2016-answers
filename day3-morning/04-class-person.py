#!/usr/bin/env python

class Person(object):
    def __init__(self, parents_choice, gender):
        self.name = parents_choice
        self.identity = gender
        
    def say_hello(self):
        print "hello world, my name is {}".format(self.name)
    
    def change_name(self, new_name):
        self.name = new_name
    
    
jt = Person("James", "male")
pd = Person("Peter", "male")

jt.say_hello()
pd.say_hello()

pd.change_name("Batman")
jt.say_hello()
pd.say_hello()

