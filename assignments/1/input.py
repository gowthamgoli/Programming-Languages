import numpy
import pickle

a = numpy.random.random_integers(-500,500,40)
sum = 0;
for item in a:
	sum = sum + item
print sum 
with open('input.txt', 'w') as thefile:
	for item in a:
  		print >> thefile, item
