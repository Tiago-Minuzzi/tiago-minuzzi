#!/usr/bin/env python
# coding: utf-8
import numpy as np
from collections import Counter


class Tokenator:
    
    def __init__(self, kmerized_seqs: np.ndarray):
        self.kmerized_seqs = kmerized_seqs
        
    
    def kmer_counts(self) -> dict[str, int]:
        kcount = dict(Counter(np.concatenate(self.kmerized_seqs).tolist()).most_common())
        return kcount
    
    
    def generate_table(self) -> dict[str, int]:
        """Returns a dictionary with indexes for unique k-mers"""
        uni_k = np.unique(np.concatenate(self.kmerized_seqs))
        self.kmer_table = { v:k+1 for k,v in enumerate(uni_k) }
        return self.kmer_table

    
    def tokenize(self) -> np.ndarray:
        """Converts string type k-mers to a integer tokens"""
        try:
            tokenized = []
            for i in self.kmerized_seqs:
                new_i = np.array([ self.kmer_table[j] for j in i])
                tokenized.append(new_i)
            return tokenized
        except TypeError:
            print("Please, generate k-mer table before tokenizing by running the generate_table() method.")
 

def kmerizer(sequencia: str, k: int = 4) -> np.ndarray:
    """Creates a numpy array containing k-mers from a string"""
    k_seq = np.array([ sequencia[i:i+k] for i in range(len(sequencia)-k+1) ])
    return k_seq

