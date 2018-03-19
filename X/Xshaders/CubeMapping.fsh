/// @param dir Sampling direction vector in world-space.
/// @return UV coordinates for the following cubemap layout:
/// +---------------------------+
/// |+X|-X|+Y|-Y|+Z|-Z|None|None|
/// +---------------------------+
Vec2 xVec3ToCubeUv(Vec3 dir)
{
	Vec3 dirAbs = abs(dir);

	int i = dirAbs.x > dirAbs.y ?
		(dirAbs.x > dirAbs.z ? 0 : 2) :
		(dirAbs.y > dirAbs.z ? 1 : 2);

	float sc, tc, ma;
	float o = 0.0;

	if (i == 0)
	{
		if (dir.x > 0)
		{
			sc = +dir.y;
			tc = -dir.z;
		}
		else
		{
			sc = -dir.y;
			tc = -dir.z;
			o = 1.0;
		}
		ma = dirAbs.x;
	}
	else if (i == 1)
	{
		if (dir.y > 0)
		{
			sc = -dir.x;
			tc = -dir.z;
		}
		else
		{
			sc = +dir.x;
			tc = -dir.z;
			o = 1.0;
		}
		ma = dirAbs.y;
	}
	else
	{
		if (dir.z > 0)
		{
			sc = +dir.y;
			tc = +dir.x;
		}
		else
		{
			sc = +dir.y;
			tc = -dir.x;
			o = 1.0;
		}
		ma = dirAbs.z;
	}

	float invL = 1.0 / length(ma);
	Vec2 st = (Vec2(sc, tc) * invL + 1.0) * 0.5;
	st.x = (float(i) * 2.0 + o + st.x) * 0.125;
	return st;
}