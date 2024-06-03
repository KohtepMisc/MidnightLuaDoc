---@diagnostic disable

---@meta _

---@class Vector3
Vector3 = {}

--- Normalizes the vector.
--- If the vector has zero length, an error is thrown.
function Vector3:normalize() end

--- Calculates the dot product of this vector with another vector.
--- @param other Vector3 The other vector to calculate the dot product with.
--- @return number The dot product of the two vectors.
function Vector3:dot(other) end

--- Calculates the cross product of this vector with another vector.
--- @param other Vector3 The other vector to calculate the cross product with.
--- @return Vector3 A new vector that is the cross product of the two vectors.
function Vector3:cross(other) end

--- Returns a new vector that is the negation of this vector.
--- @return Vector3 A new vector where each component is the negation of the corresponding component of this vector.
function Vector3:get_negated() end

--- Returns a normalized copy of this vector.
--- @return Vector3 A new vector that is the normalized version of this vector.
function Vector3:get_normalized() end

--- Checks if this vector is approximately equal to another vector, within a specified tolerance.
--- @param other Vector3 The vector to compare with.
--- @param tolerance number The tolerance within which the vectors are considered equal.
--- @return boolean Returns true if the vectors are approximately equal within the given tolerance, otherwise false.
function Vector3:is_equal_tol(other, tolerance) end

--- Determines if the vector is a zero vector.
--- @return boolean Returns true if all components of the vector are zero, otherwise false.
function Vector3:is_zero() end

--- Calculates the length (magnitude) of the vector.
--- @return number The length of the vector.
function Vector3:length() end

--- Calculates the 2D length (magnitude) of the vector ignoring the z component.
--- @return number The 2D length of the vector.
function Vector3:length_2d() end

--- Calculates the squared 2D length of the vector, ignoring the z component.
--- Useful for comparisons where the exact length is not necessary.
--- @return number The squared 2D length of the vector.
function Vector3:length_2d_sqr() end

--- Calculates the squared length of the vector.
--- Useful for comparisons where the exact length is not necessary.
--- @return number The squared length of the vector.
function Vector3:length_sqr() end

--- Multiplies each component of the vector by a scalar.
--- @param scalar number The scalar to multiply with.
function Vector3:mul(scalar) end

--- Negates each component of the vector.
function Vector3:negate() end

--- Assigns random values to each component of the vector within the specified range.
--- @param min number The minimum value (inclusive) - defaults to -1.0.
--- @param max number The maximum value (inclusive) - defaults to 1.0.
function Vector3:random(min, max) end

--- Sets the vector's components to those of another vector.
--- @param vector Vector3 The vector from which to copy the components.
function Vector3:set(vector) end

--- Sets the components of the vector to the provided values.
--- @param x_val number The new x value.
--- @param y_val number The new y value.
--- @param z_val number The new z value.
function Vector3:set_unpacked(x_val, y_val, z_val) end

--- Subtracts another vector from this vector.
--- @param vector Vector3 The vector to subtract.
function Vector3:sub(vector) end

--- Unpacks the vector's components and returns them as individual values.
--- @return number, number, number The x, y, and z components of the vector.
function Vector3:unpack() end

--- Checks if the vector is within an axis-aligned bounding box defined by two points.
--- @param boxStart Vector3 The starting point of the bounding box.
--- @param boxEnd Vector3 The ending point of the bounding box.
--- @return boolean Returns true if the vector is within the bounding box, otherwise false.
function Vector3:within_aabox(boxStart, boxEnd) end

--- Sets all components of the vector to zero.
function Vector3:zero() end

--- Calculates the distance to another vector.
--- @param other Vector3 The other vector.
--- @return number The distance between the two vectors.
function Vector3:distance(other) end

--- Calculates the squared distance to another vector.
--- Useful for distance comparisons where the exact distance is not necessary.
--- @param other Vector3 The other vector.
--- @return number The squared distance to the other vector.
function Vector3:dist_to_sqr(other) end