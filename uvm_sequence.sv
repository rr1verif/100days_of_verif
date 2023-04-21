// A mux selects a output from provided 2^n outputs. And it selects based on select line. If there is 
// 2^n inputs the n no of select lines are required
// Add code here //Mux sequence 
class mux_sequence extends uvm_sequence_item;

   rand logic[7:0] input1;
   rand logic[7:0] input2;
   rand logic       sel1;
   

  //Add factory code
  `uvm_object_utils(mux_sequence)
  
  //Add new constructor
  function new (string name = "mux_sequence");
    super.new(name);
  endfunction
  
  //Add constraints
  
  endclass mux_sequence