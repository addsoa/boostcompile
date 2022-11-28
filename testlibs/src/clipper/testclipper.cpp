#include <clipper/clipper.hpp>
#include <cstddef>

int main() {
	ClipperLib::ClipperOffset offset;
	double a = offset.ArcTolerance;
	printf("offset = %f \n", a);
}
