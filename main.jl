using PyCall
@pyimport matplotlib.pyplot as plt

include("generate_data.jl")

plt.imshow(my_matrix, interpolation="nearest")
plt.show()

