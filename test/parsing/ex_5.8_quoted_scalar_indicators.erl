-module('ex_5.8_quoted_scalar_indicators').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [],
        <<>>,
        30,
        true,
        [],
        0,
        31,
        3,
        1,
        false,
        2,
        15,
        utf8,
        false,
        undefined,
        _,
        _,
        [],
        {bcoll,root,0,-1,1,1,-1,1,1},
        false,
        false,
        false,
        [{impl_key,false,false,undefined,undefined,1,1}],
        false,
        false,
        _,
        [],
        0,
        15,
        14,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,2,15},
          {yamerl_doc_end,2,15},
          {yamerl_collection_end,2,15,block,mapping},
          {yamerl_scalar,2,9,
            {yamerl_tag,2,9,{non_specific,"!"}},
            flow,double_quoted,"text"},
          {yamerl_mapping_value,2,7},
          {yamerl_scalar,2,1,
            {yamerl_tag,2,1,{non_specific,"?"}},
            flow,plain,"double"},
          {yamerl_mapping_key,2,1},
          {yamerl_scalar,1,9,
            {yamerl_tag,1,9,{non_specific,"!"}},
            flow,single_quoted,"text"},
          {yamerl_mapping_value,1,7},
          {yamerl_scalar,1,1,
            {yamerl_tag,1,1,{non_specific,"?"}},
            flow,plain,"single"},
          {yamerl_mapping_key,1,1},
          {yamerl_collection_start,1,1,
            {yamerl_tag,1,1,{non_specific,"?"}},
            block,mapping},
          {yamerl_doc_start,1,1,{1,2},_},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME)
    ).
