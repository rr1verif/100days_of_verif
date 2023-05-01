//Agent file is used to create instance of monitor, driver and sequencer (if active agent then driver and sequencer is created")
class uvm_test_agent extends uvm_agent;
  
  `uvm_component_utils(uvm_test_agent);
  
  uvm_active_passive_enum is_active:
  uvm_test_mon            mux_mon;
  uvm_test_sequencer      mux_sequencer;
  uvm_test_driver         mux_driver;
  
  function new (string name = "uvm_test_agent" , uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mux_mon = uvm_test_mon::type_id::create_id("mux_mon",this);
    if (is_active == UVM_ACTIVE) begin //{
      mux_sequencer = uvm_test_sequencer::type_id::create_id("mux_sequencer",this);
      mux_driver    = uvm_test_driver::type_id::create_id("uvm_test_driver",this);
    end //}
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (is_active == UVM_ACTIVE)
      mux_driver.seq_item_port.connect(mux_sequencer.seq_item_export);
  endfunction
  
endclass
    
