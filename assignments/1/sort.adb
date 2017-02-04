with Text_Io;
use Text_Io;

package body Sort is	
	
	package Int_Io is new Integer_Io(Integer);
    use Int_Io;

	procedure MergeSort(A: in out listofNumbers; B: in out listofNumbers; First : Integer; Last : Integer) is

		task type Sort_task(startIndex: Integer; endIndex : Integer; Taskno : Integer) is
		end Sort_task;

		task body Sort_Task is
    	begin 
    		--Put_Line("Task" & Taskno'img & " calls MergeSort("&startIndex'img& ", " &endIndex'img & ")");
        	MergeSort(A, B, startIndex, endIndex); 
    	end Sort_Task; 

    	mid : Integer;
		i : Integer;
		j : Integer;
		k : Integer;

    begin
    	if First < Last then
    		mid := (First+Last)/2;
	    	declare
	    		-- Cocurrent Divide
		    Task_MergeFirstHalf : Sort_task(First, mid, 1);
			Task_MergeSecondHalf : Sort_task(mid+1, Last, 2);

			begin
				null;
			end;
			--MergeSort(A, B, First, mid);
			--MergeSort(A, B, mid+1, Last);
			-- Wait until the above two concurrent tasks are completed and the perform merge
			--Put_Line("First = " & First'img & " Last = " & Last'img & " mid = " & mid'img);
			i := First;
			j := mid+1;
			k := First;

			while i<= mid and j <= Last loop
				--Put_Line("A(" & i'img & ") = " & A(i)'img);
				--Put_Line("A(" & j'img & ") = " & A(j)'img);
				if A(i) < A(j) then
					B(k) := A(i);
					--Put_Line("B(" & k'img & ") = " & B(k)'img);
					i := i+1;
					k := k+1;
				else
					B(k) := A(j);
					--Put_Line("B(" & k'img & ") = " & B(k)'img);
					j := j+1;
					k := k+1;
				end if;
			end loop;

			while i <= mid loop
				--Put_Line("A(" & i'img & ") = " & A(i)'img);
				B(k) := A(i);
				--Put_Line("B(" & k'img & ") = " & B(k)'img);
				i := i+1;
				k := k+1;
			end loop;

			while j <= Last loop
				--Put_Line("A(" & j'img & ") = " & A(j)'img);
				B(k) := A(j);
				--Put_Line("B(" & k'img & ") = " & B(k)'img);
				j := j+1;
				k := k+1;
			end loop;

			for p in First .. Last loop
				A(p) := B(p);
				--Put("B(" & p'img & ") = " & B(p)'img );
				--Put("A(" & p'img & ") = " & A(p)'img );
			end loop;
			--New_line;	
		end if;
	end MergeSort;
end Sort;