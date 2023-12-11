def _parse_while(self):
    self._init_mac()
    self._wc = 0
    self._wl = []
    self._iter_lines(self._p_while)


def _p_while(self, line, p, o):
    l = line[1:].split(")")
    if line[0] != "$":
        return line
    elif line.split("(")[0] not in self._m:
        self._flag = False
        self._line = o
        self._errm = "Macro non-existent"
        return ""
    elif l[1] != "" or len(l) > 2:
        self._flag = False
        self._line = o
        self._errm = "Code after macro"
        return ""
    else:
        if line.split("(")[0] == self._m[3]:
            l = line.split("(")
            n = ""
            for i in l[1]:
                if i.isdigit() or i.isalpha():
                    n = n + i

            self._wc += 1
            self._wl.append(self._wc)
            
            return f"(WHILE{self._wc})\n@{n}\nD=M\n@END{self._wc}\nD;JEQ"
        
        elif line.split("(")[0] == self._m[4]:
            g = self._wl.pop()
            return f"@WHILE{g}\n0;JMP\n(END{g})"
        
        else:
            return line

def _init_mac(self):
    self._m = ["$MV","$SWP","$SUM","$WHILE","$END"]