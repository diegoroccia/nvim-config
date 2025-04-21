; extends

(block_mapping_pair
  key:   ( flow_node ) @organization (#match? @organization "^zalando(-organisation)?$" )
  value: (block_node
           (block_mapping
             (block_mapping_pair
               key: ( flow_node ) @values_key (#eq? @values_key "values" )
               value: (block_node
                        (block_mapping
                          (block_mapping_pair
                            key: ( flow_node ) @accounts_key (#eq? @accounts_key "accounts" )
                            value: (block_node
                                     (block_mapping
                                       (block_mapping_pair
                                         key: (flow_node) @account_id
                                         )
                                       )
                                     )
                            )
                          )
                        )
               )
             )
           )
  )

( block_mapping_pair
  key:   ( flow_node ) @accounts_key (#eq? @accounts_key "accounts" )
  value: ( block_node
          ( block_mapping
           ( block_mapping_pair
             key:   (flow_node) @account_id
             value: ( block_node
                     ( block_mapping
                      ( block_mapping_pair
                        key:   (flow_node) @values (#eq? @values "values")
                      )
                     )
                    )
           )
          )
         )
)
