with Text_Io, Ada.Integer_Text_Io;
use Text_Io, Ada.Integer_Text_Io;

with Sort;
use Sort;

procedure ProgMain is


    A : listofNumbers; --:= (6, 4, 5, 8, 3, 2, 7, 1);
    B : listofNumbers;
    SumA : Integer;

    package Int_Io is new Integer_Io(Integer);
    use Int_Io;

    task type Reader is 
    	entry ReaderDone;
    end Reader;

    task type Sum is
    	entry startSum;
    end Sum;

    task type Printer is 
   		entry startPrint;
   	end Printer;

    task body Reader is 
    begin 
    	for k in 1 .. SIZE loop
    		Ada.Integer_Text_Io.get(Integer(A(k)));
    	end loop;

    	accept ReaderDone do
    		null;
    	end ReaderDone;
    end Reader;

    task body Sum is
    begin
    	accept startSum;
    	SumA := 0;
	    for k in 1 .. SIZE loop
	    	SumA := SumA + Integer(A(k));
	    end loop;	    
    end Sum;

    task body Printer is
    begin
    	accept startPrint;
    	for index in 1 .. SIZE loop
			Ada.Integer_Text_Io.Put(Integer(A(index)));
		end loop;
		Ada.Integer_Text_Io.Put(SumA);
    end Printer;

    T1 : Reader;
    T2 : Sum;
    T3 : Printer;

begin

	T1.ReaderDone;

	for p in 1 .. SIZE loop
		B(p) := 0;
	end loop;

	MergeSort(A, B, 1, SIZE);

	T2.startSum;
	T3.startPrint;


end ProgMain;
