class uvm_test_checker extends uvm_component; //Check whether checker are uvm_component type or anyother type
  
  //Factory
  `uvm_components_utils(uvm_test_checker);
  
  //New Constructor
  function new (string name = "uvm_test_checker", uvm_component parent = null);
    super.new(name,parent);
  endfunction
    
endclass
