//Clear map from trees
while(instance_exists(obj_tree))
{
    with(obj_tree)
    {
        instance_destroy();
    }
}
//Generate new trees
generate_map(35);

