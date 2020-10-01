package com.yedam.erp.view.websocket;

public class MsgVO {
	String cmd;
	String id; 
	String msg;

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String toString() {
		return "MsgVO [cmd=" + cmd + ", id=" + id + ", msg=" + msg + "]";
	}	
}