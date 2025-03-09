(
  (block_mapping_pair
    key: (flow_node) @_kind_key (#eq? @_kind_key "kind")
    value: (flow_node (plain_scalar)) @_kind_value (#eq? @_kind_value "KCLInput")
  )
  (block_mapping_pair
    key: (flow_node) @_spec_key (#eq? @_spec_key "spec")
    value: (block_node ( block_mapping (block_mapping_pair
        key: (flow_node) @_source_key (#eq? @_source_key "source")
        value: (block_node (block_scalar) @injection.content)
        (#set! injection.language "kcl")
        (#offset! @injection.content 0 1 0 0)
                                         )))
  )
 )
