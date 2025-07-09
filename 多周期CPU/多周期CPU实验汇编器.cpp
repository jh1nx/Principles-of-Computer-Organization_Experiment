#include<iostream>
#include<sstream>
#include<string>
#include<unordered_map>
#include<bitset>
using namespace std;
unordered_map<string,string> op_map={
	{"addiu","001001"},
	{"ori","001101"},
	{"xori","001110"},
	{"sub","000000"},
	{"add","000000"},
	{"and","000000"},
	{"sll","000000"},
	{"beq","000100"},
	{"jal","000011"},
	{"slt","000000"},
	{"slti","001010"},
	{"bne","000101"},
	{"bltz","000001"},
	{"andi","001100"},
	{"j","000010"},
	{"sw","101011"},
	{"lw","100011"},
	{"jr","000000"},
	{"halt","111111"}
};	//op码转换表
unordered_map<string,string> reg_map={
    {"$0","00000"},{"$1","00001"},{"$2","00010"},{"$3","00011"},
    {"$4","00100"},{"$5","00101"},{"$6","00110"},{"$7","00111"},
    {"$8","01000"},{"$9","01001"},{"$10","01010"},{"$11","01011"},
    {"$12","01100"},{"$13","01101"},{"$14","01110"},{"$31","11111"}
};	//寄存器转换表
string transfer(string& instruction){
	for(int i=0;i<instruction.size();i++){
		if(instruction[i]==','||instruction[i]=='('||instruction[i]==')'){
			instruction[i]=' ';		//把和转换机器码无关的字符换成空格，方便分离输入流
		}
	}
    stringstream ss(instruction);
    string op,rd,rs,rt,immediate,address,shamt;
    ss>>op;
    string machine_code=op_map[op];
    if(op=="addiu"||op=="andi"||op =="ori"||op=="xori"||op=="slti"){
        ss>>rt>>rs>>immediate;
        machine_code+=reg_map[rs]+reg_map[rt]+bitset<16>(stoi(immediate)).to_string();
    }
	else if(op=="add"||op=="sub"||op=="and"||op=="slt"){
        ss>>rd>>rs>>rt;
        machine_code+=reg_map[rs]+reg_map[rt]+reg_map[rd]+"00000";
        if(op=="add"){
        	machine_code+="100000";
		}
        else if(op=="sub"){
            machine_code+="100010";
        } 
		else if(op=="and"){
            machine_code+="100100";
        }
        else if(op=="slt"){
            machine_code+="101010";
        }
    }	
    else if(op=="sll"){
    	ss>>rd>>rt>>shamt;
    	machine_code+="00000"+reg_map[rt]+reg_map[rd]+bitset<5>(stoi(shamt)).to_string()+"000000";
	}
	else if(op=="jal"||op=="j"){
        ss>>address;
        machine_code+=bitset<26>(stoi(address, nullptr, 0)>>2).to_string();		//指令jal和j的立即数有缩进，需要特别留意
    }
	else if(op=="sw"||op=="lw"){
        ss>>rt>>immediate>>rs;
        machine_code+=reg_map[rs]+reg_map[rt]+bitset<16>(stoi(immediate)).to_string();
    }
	else if(op=="jr"){
        ss>>rs;
        machine_code+=reg_map[rs]+"000000000000000001000";
    }
    else if(op=="beq"||op=="bne"){
    	ss>>rs>>rt>>immediate;
    	machine_code+=reg_map[rs]+reg_map[rt]+bitset<16>(stoi(immediate)).to_string();
	}
	else if(op=="bltz"){
        ss>>rs>>immediate;
        machine_code+=reg_map[rs]+"00000"+bitset<16>(stoi(immediate)).to_string();
    }
    else if(op=="halt"){
    	machine_code+="00000000000000000000000000";
	}
    return machine_code;
}

int main() {
    string instruction;
    while(getline(cin,instruction)){
    	string machine_code;
    	machine_code=transfer(instruction);
    	for(int i=0;i<32;i++){
    		cout<<machine_code[i];
    		if(i%8==7){
    			cout<<" ";
			}
		}	
		//使用getline读取输入，因为MIPS指令里含有空格
		//需要用空格把32位机器码分割成四个8位二进制码
		cout<<endl;
	}
    return 0;
}