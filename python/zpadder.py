import numpy as np


def zero_padder(arr: list[ int | np.ndarray ], pad_len: int = None) -> np.ndarray:
    """Appends zeros to inner arrays of list of arrays
    to desire padding length. If no padding length is provided, 
    pads to the length of the longest array."""
    # Get max length
    max_len = max([len(i) for i in arr])
    # If padding length is provided, max_len = pad_len
    if pad_len:
        max_len = pad_len
    # Array padding
    padded = np.array([ np.hstack( ( a, np.zeros( max_len - len(a) ) ) ) for a in arr ])
    return padded
