-module('option_doc_version_forced').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [{doc_version, {1,2}}],
        <<>>,
        14,
        true,
        [],
        0,
        15,
        3,
        1,
        false,
        2,
        4,
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
        7,
        6,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,2,4},
          {yamerl_doc_end,2,4},
          {yamerl_scalar,2,4,
            {yamerl_tag,2,4,{non_specific,"?"}},
            flow,plain,[]},
          {yamerl_doc_start,2,1,{1,2},_},
          {yamerl_yaml_directive,1,1,{0,9}},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME, [{doc_version, {1,2}}])
    ).
