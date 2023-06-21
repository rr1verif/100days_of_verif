1. constraints
2. solve before 
3. arrays and its methods
4. queues
5. fc coding bins
6. enum
7. loops
8. fork join
9. interprocess communication, semaphores
10. casting & :: operator



class test_1;
  rand bit[2:0] x;
  randc bit[2:0] y;
endclass;

module top;
  test_1 t;
  initial begin //{
    t = new();
    repeat (8) begin //{
      t.x.rand_mode(0);
      t.randomize();
      t.x.rand_mode(0);
      $display("xis %0d & y is %0d", t.x, t.y);
    end //}
  end //}
endmodule

The initial state of reg is x unknown, wire is z.

to define a variable of type time
time t;
t = $realtime(); //to assign the simulation time to variable


file input output handling in SV ->
  module file_tb_test_top;
    int readlines;
    initial begin ; //{
      readlines = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt", "r");
      $fclose(readlines);
    end //}
  endmodule
  
  Other applicable file handling codes in SV :
   1. readlines = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt", "w"); // to overwrite the file
   2. readlines = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt", "a"); //to append lines in file
   3. readlines = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt", "r+"); 
   4. readlines = $fopen("../../read_this_file.txt", "w+"); //Here the current working dir is /user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/tb/env
   
   
   module file_file_io_test_top;
    int upd_file, upd_file, upd_file2, i, idx;
    string first_line, line, str;
    initial begin ; //{
      upd_file = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt", "w");
      for (int i = 0; i < 10; i++) begin //{
        $fdisplay(upd_file, "Current iteration is %0d", i); //$fdisplay will overwrite the corresponding line in the file 
      end //}
      $fclose(upd_file);
      
      //Reading lines written into the file
      upd_file1 = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt","r+");
      $fgets(first_line, upd_file1);
      $display(" First line is %s", first_line);
      $fwrite(first_line, upd_file); //$fwrite is also used to add lines 
      $fgets(line,upd_file);
      $display("Next line is %s", line);
      for (int i = 0; i<3; i++) begin //{
        $fgets(line, upd_file);
        $display("(%0d+2)th line is %s", i, line);
      end //}
      $fclose(upd_file1);    
      
      //Code to read until end of line
      upd_file2 = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt","r+");
      while(!$feof(upd_file2) begin //{
        $fgets(line,upd_file2);
        $display("%0d th line is %s", i, line);
        i++;
      end //}
      $fclose(upd_file2);
      
      //Code to find the matches - $fscanf
      upd_file1 = $fopen("/user/ssirpresto1/VERIFY/users/r.rishu/new/unit_file/read_this_file.txt","r+");
      str = "Current iteration is";
      while ($fscanf(upd_file1, "%s = %0d, str, idx) == 2) begin //{
        $dispaly("Line: %s = %0d", str, idx);
        idx++;
      end //}
      $fclose(upd_file1)
      //The above code regarding $fscanf will print all the lines until it will get two matches of a line
      
    end //}
  endmodule
  
  Exception handling in SV ->
                     class fatal_err_demoter extends uvm_report_catcher;
                       static int demoted_message_count;
                       bit err_demoted;
                       
                       `uvm_object_utils(fatal_err_domter)
                       
                       function void new(string name = "fatal_error_demoter" );
                         super.new(name);
                       endfunction 
                       
                       function action_e catch(); //{
                         if((get_severity() == UVM_FATAL) && (get_message() == "UVM_ERROR : Invalid address from scoreboard")) begin //{
                           set_severity(UVM_INFO);
                           err_demoted = 1;
                           demoted_message_count++;
                         end //}
                         return THROW;
                       endfunction: catch//}
                     endclass
                     
                     virtual function void build_phase(uvm_phase phase); //{
                       super.build_phase(phase);
                       uvm_report_cb::add(uvm_test_top.env_o.host_vip_o.axi_monitor. demoter);
                                          //uvm_report_cb::add_by_name("cdnaxiuvmusermonitor",demoter); -> This could be used in case exxact hierarchy is not known to the user
                     endfunction //}
