var inst = instance_place(x, y, Obj_hurtbox);

if (inst != noone) && (inst.hittable == true) && (inst.from != id)
{
	with(inst)
	{
		instance_destroy()
	}
}