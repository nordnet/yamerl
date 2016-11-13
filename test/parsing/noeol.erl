-module('noeol').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [{io_blocksize, 1}],
        <<>>,
        31,
        true,
        [],
        0,
        32,
        3,
        6,
        false,
        3,
        6,
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
        11,
        10,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,3,6},
          {yamerl_doc_end,3,6},
          {yamerl_collection_end,3,6,block,sequence},
          {yamerl_scalar,3,3,
            {yamerl_tag,3,3,{non_specific,"?"}},
            flow,plain,"two"},
          {yamerl_sequence_entry,3,1},
          {yamerl_scalar,2,3,
            {yamerl_tag,2,3,{non_specific,"?"}},
            flow,plain,"one"},
          {yamerl_sequence_entry,2,1},
          {yamerl_collection_start,2,1,
            {yamerl_tag,2,1,{non_specific,"?"}},
            block,sequence},
          {yamerl_doc_start,2,1,{1,2},_},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME, [{io_blocksize, 1}])
    ).
