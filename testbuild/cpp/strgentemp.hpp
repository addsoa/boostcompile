#include <string>
#include <vector>
#include <sstream>
#include <iterator>
#include <algorithm>

class GenStrTemp {
public:
    template<typename T>
    static std::string GenStr(const std::vector<T>& vs, const std::string delimiter = " ") {
        std::stringstream output;
        std::copy(vs.begin(), vs.end(), std::ostream_iterator<const T>(output, delimiter.c_str()));

        return output.str();
    }

    template<typename T>
    static std::string GenStr(std::vector<T>&& vs, const std::string delimiter = " ") {
        std::stringstream output;
        std::copy(vs.begin(), vs.end(), std::ostream_iterator<T>(output, delimiter.c_str()));

        return output.str();
    }
};