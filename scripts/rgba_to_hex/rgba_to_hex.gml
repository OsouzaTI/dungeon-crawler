/// @description Convert RGBA color to hexadecimal
/// @param r Red channel value (0-255)
/// @param g Green channel value (0-255)
/// @param b Blue channel value (0-255)
/// @param a Alpha channel value (0-255)
/// @return Hexadecimal string representing the color
function rgba_to_hex(r, g, b, a) {
    var hex = "";
    hex += string_format("%02X", r, 2);
    hex += string_format("%02X", g, 2);
    hex += string_format("%02X", b, 2);
    hex += string_format("%02X", a, 2);
    return hex;
}
