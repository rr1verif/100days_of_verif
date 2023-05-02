class mux_sequence #(mux_sequence_item) extends uvm_sequence;
  
  `uvm_component_utils(mux_sequence);
  
  function void new()
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  virtual task start (uvm_test_sequencer seqr);
    mux_sequence_item.start(env_o.mux_agent.seqr); //mux_agent is a object of uvm_test_agent
  endtask
  
endclass
