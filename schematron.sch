<!--
© ISO/IEC 2017
The following permission notice and disclaimer shall be included in all
copies of this XML schema ("the Schema"), and derivations of the Schema:
Permission is hereby granted, free of charge in perpetuity, to any
person obtaining a copy of the Schema, to use, copy, modify, merge and
distribute free of charge, copies of the Schema for the purposes of
developing, implementing, installing and using software based on the
Schema, and to permit persons to whom the Schema is furnished to do so,
subject to the following conditions:
THE SCHEMA IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SCHEMA OR THE USE OR
OTHER DEALINGS IN THE SCHEMA.
In addition, any modified copy of the Schema shall include the following
notice:
THIS SCHEMA HAS BEEN MODIFIED FROM THE SCHEMA DEFINED IN ISO/IEC 19757 3,
AND SHOULD NOT BE INTERPRETED AS COMPLYING WITH THAT STANDARD."
-->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xml:lang="en">
    <sch:title>Schema for Additional Constraints in Schematron</sch:title>
    <sch:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>
    <sch:p>This schema supplies some constraints in addition to those given in the
        ISO/IEC 19757 2
        (RELAX NG Compact Syntax) Schema for Schematron. </sch:p>
    <sch:pattern>
        <sch:rule context="sch:active">
            <sch:assert test="//sch:pattern[@id=current()/@pattern]"> The pattern
                attribute of the active element shall match the id
                attribute of a pattern.</sch:assert>
        </sch:rule>
        <sch:rule context="sch:pattern[@is-a]">
            <sch:assert test="//sch:pattern[@abstract='true'][@id=current()/@is-a]"> The
                is-a attribute of a pattern element shall match 
                the id attribute of an abstract pattern.
            </sch:assert>
        </sch:rule>
        <sch:rule context="sch:extends">
            <sch:assert test="//sch:rule[@abstract='true'][@id=current()/@rule]"> The rule
                attribute of an extends element shall match the id
                attribute of an abstract rule.
            </sch:assert>
        </sch:rule>
        <sch:rule context="sch:let">
            <sch:assert
                test="not(//sch:pattern
                [@abstract='true']/sch:param[@name=current()/@name])"
                > A variable name and an abstract pattern parameter should not use the
                same name.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
