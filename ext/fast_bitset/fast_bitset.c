#include "ruby.h"

VALUE FastBitsetModule = Qnil;

VALUE rb_fast_bitset_get_ids(VALUE self, VALUE bitstring) {
  VALUE ids = rb_ary_new();

  Check_Type(bitstring, T_STRING);


  char *ids_input = RSTRING_PTR(bitstring);
  int length      = RSTRING_LEN(bitstring);

  int base = 0;

  char current;
  int i, j;

  for(i = 0; i < length; i++) {
    current = ids_input[i];


    for(j = 0; j < 8; j++) {
      char bitmask = (1<<(7-j));
      if(bitmask & current) {
        rb_ary_push(ids, INT2NUM(base + j));
      } 
    }

    base += 8;
  }

  return ids;
}

void rb_init_fast_bitset() {
  rb_define_module_function(FastBitsetModule, "bitstring_to_id", rb_fast_bitset_get_ids, 1);
}

void Init_fast_bitset()
{
    FastBitsetModule = rb_define_module("FastBitset");
    rb_init_fast_bitset();
}