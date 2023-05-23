class mux_sequence #(mux_sequence_item) extends uvm_sequence;
  
  `uvm_component_utils(mux_sequence);
  
  //Check whether sequencer handle is a must or not
  //`uvm_declare_p_sequencer(seqr);
  
  function void new(string name= "mux_sequence", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  virtual task start (uvm_test_sequencer seqr);
    mux_sequence_item1.start(env_o.mux_agent.seqr); //mux_agent is a object of uvm_test_agent
  endtask
  
  task body();
    mux_sequence_item1 = mux_sequence_item::type_id::create_id("mux_sequence_item1");
    start_item(mux_sequence_item);
    mux_sequence_item1.randomize();
    finish_item(mux_sequence_item1);
  endtask
  
endclass
