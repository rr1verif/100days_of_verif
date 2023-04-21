class uvm_test_driver extends uvm_driver;
  //Fatory
  `uvm_components_utils(uvm_test_driver);
  
  //New constructor
  function new (string name = "uvm_test_driver", uvm_component parent = null);
    super.this(name);
  endfunction
