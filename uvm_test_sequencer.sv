class uvm_test_sequencer extends uvm_sequencer;
  
  //Factory registration
  `uvm_components_utils(uvm_test_sequencer)

  //New constructor
  function new(string name = "uvm_test_sequencer", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
endclass
