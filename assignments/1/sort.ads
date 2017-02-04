package Sort is 
	SIZE : Integer := 40;
	type Numbers is range -500 .. 500;
	type listofNumbers is  array(1 .. SIZE) of Numbers;
	pragma Volatile_Components(listofNumbers);
	procedure MergeSort(A : in out listofNumbers; B : in out listofNumbers; First : Integer; Last : Integer);
end Sort;