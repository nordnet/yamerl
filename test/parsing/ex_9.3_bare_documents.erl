-module('ex_9.3_bare_documents').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [],
        <<>>,
        53,
        true,
        [],
        0,
        54,
        8,
        1,
        false,
        8,
        1,
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
        9,
        8,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,8,1},
          {yamerl_doc_end,8,1},
          {yamerl_scalar,6,1,
            {yamerl_tag,6,1,{non_specific,"!"}},
            block,literal,"%!PS-Adobe-2.0\n"},
          {yamerl_doc_start,6,1,{1,2},_},
          {yamerl_doc_end,3,1},
          {yamerl_scalar,1,1,
            {yamerl_tag,1,1,{non_specific,"?"}},
            flow,plain,"Bare document"},
          {yamerl_doc_start,1,1,{1,2},_},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME)
    ).
