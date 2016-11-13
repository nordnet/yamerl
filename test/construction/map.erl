-module(map).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/construction/" ?MODULE_STRING ".yaml").

setup() ->
    application:start(yamerl).

simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            [
              {"first", [{"item", 1}]},
              {"second", [{"item", 2}]}
            ]
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, false}])
        )
      ]
    }.

detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_map,yamerl_node_map,"tag:yaml.org,2002:map",
                [{line,1},{column,1}],
                [{{yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                      [{line,1},{column,1}],
                      "first"},
                    {yamerl_map,yamerl_node_map,"tag:yaml.org,2002:map",
                      [{line,1},{column,9}],
                      [{{yamerl_str,yamerl_node_str,
                            "tag:yaml.org,2002:str",
                            [{line,1},{column,11}],
                            "item"},
                          {yamerl_int,yamerl_node_int,
                            "tag:yaml.org,2002:int",
                            [{line,1},{column,17}],
                            1}}]}},
                  {{yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                      [{line,2},{column,1}],
                      "second"},
                    {yamerl_map,yamerl_node_map,"tag:yaml.org,2002:map",
                      [{line,2},{column,9}],
                      [{{yamerl_str,yamerl_node_str,
                            "tag:yaml.org,2002:str",
                            [{line,2},{column,11}],
                            "item"},
                          {yamerl_int,yamerl_node_int,
                            "tag:yaml.org,2002:int",
                            [{line,2},{column,17}],
                            2}}]}}]}}
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, true}])
        )
      ]
    }.
