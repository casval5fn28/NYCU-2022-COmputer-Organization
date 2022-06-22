#include "set_associative_cache.h"
#include "string"
#include <fstream>

using namespace std;

int BitNum_sec(int num) {
    int n = 0;
    while (num >= 2) {
        num /= 2;
        n++;
    }
    return n;
}

float set_associative(string filename, int way, int block_size, int cache_size){
    int total_num = 0;
    int hit_num = 0;

    /*write your code HERE*/
    ifstream file;
    string str;
    int byte_offset = BitNum_sec(block_size);
    int idx_range = cache_size / (block_size*way);
    int index = BitNum_sec(idx_range);
    int cache[idx_range][way];
    int used_block[idx_range]={};

    file.open(filename);
    while (file >> str) {
        if (file.eof()) {
            break;
        }
        bool hit = false;
        unsigned int bit_str = strtoul(str.c_str(), NULL, 16);
        unsigned int idx = (bit_str>> byte_offset) % idx_range;
        unsigned int tag = bit_str >> (byte_offset + index);

        for(int i = 0; i < used_block[idx]; i++){
            if(cache[idx][i] == tag){
                for(int j = i; j < used_block[idx]-1; j++){
                    cache[idx][j] = cache[idx][j+1];
                }
                cache[idx][used_block[idx]-1] = tag;
                hit_num++;
                hit = true;
                break;
            }
        }

        if(hit == false){
            if(used_block[idx] == way){
                for(int j = 0; j < way-1; j++){
                    cache[idx][j] = cache[idx][j+1];
                }
                cache[idx][way-1] = tag;
            }
            else{
                cache[idx][used_block[idx]] = tag;
                used_block[idx]++;
            }
        }
        total_num++;
    }

    file.close();
    return (float)hit_num/total_num;
}
