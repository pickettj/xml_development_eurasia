#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 12 12:54:27 2020

@author: James

# General Hanley on F-strings: I made a few other changes too, the major one is useing f-strings,
# which is a great new feature. (You need to have python version >=3.6)
"""


import re


def serial_no (input_file):
    # Isolating the document serial number from the file name
    if ".txt" in input_file:
        ret = re.match(r'[^0-9]*([0-9]+)\.txt', input_file)
        doc_serial, = ret.groups()
    elif ".md" in input_file:
        ret = re.match(r'[^0-9]*([0-9]+)\.md', input_file)
        doc_serial, = ret.groups()
    return  doc_serial



def parse_md (input_file):
    # Isolating the document serial number from the file name
    if ".txt" in input_file:
        ret = re.match(r'[^0-9]*([0-9]+)\.txt', input_file)
        doc_serial, = ret.groups()
        doc_serial_xml = '<document serial = "' + doc_serial + '">'
    elif ".md" in input_file:
        ret = re.match(r'[^0-9]*([0-9]+)\.md', input_file)
        doc_serial, = ret.groups()
        doc_serial_xml = '<document serial = "' + doc_serial + '">'
        
    # Read in the file
    with open(input_file) as fin:
        text = fin.read()
    
    # Parsing the Markdown into XML using f-strings
    conv = text
    conv = re.sub(r'^ *\- ', r'\t<lb/>', conv, flags=re.MULTILINE)
    conv = re.sub(r'\----', r'</div>\n<div>', conv, flags=re.MULTILINE)
    conv = re.sub(r'(\*[^\*\n]+\*)', r'<flag>\1</flag>', conv)
    conv = re.sub(r'\*', r'', conv)
    conv = re.sub(r'^> (.*)$', r'<!-- \1 -->', conv, flags=re.MULTILINE)
    
    body = '\n'.join([f'\t{s}' for s in conv.split('\n')])
    final = f"""
    <?xml-model href="../../../../../Projects/xml_development_eurasia/schemas/persian_documents_schema_basic.rnc" type="application/relax-ng-compact-syntax"?>
    <document>
    {body}
    </document>
    """.strip()
    
    final = re.sub(r'</div>', '', final, count=1)
    final = re.sub (r'<document>', doc_serial_xml, final)
        
    return final