-module('enc_utf32be_char').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [{io_blocksize, 1}],
        <<>>,
        80,
        true,
        [],
        0,
        21,
        2,
        1,
        false,
        1,
        20,
        {utf32,big},
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
        3,
        2,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,1,20},
          {yamerl_stream_start,1,1,{utf32,big}}
        ]
      },
      yamerl_parser:file(?FILENAME, [{io_blocksize, 1}])
    ).
