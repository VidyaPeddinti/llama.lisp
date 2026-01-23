{
  "functions": [
    {
      "name": "memcpy4",
      "type": "void",
      "attrs": [
        "inline"
      ],
      "args": [
        {
          "name": "dst",
          "type": {
            "ptr": "int8"
          }
        },
        {
          "name": "src",
          "type": {
            "ptr": "int8"
          }
        }
      ],
      "instrs": [
        {
          "op": "asm",
          "type": {
            "struct": "int4"
          },
          "dest": "temp",
          "args": [
            [
              "string",
              "ld.global.v4.b32 {$0, $1, $2, $3}, [$4]; st.global.v4.b32 [$5], {$0, $1, $2, $3};"
            ],
            [
              "string",
              "=&r,=&r,=&r,=&r,l,l"
            ],
            "src",
            "dst"
          ]
        },
        {
          "op": "ret",
          "args": []
        }
      ]
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.y",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.read.ptx.sreg.tid.x",
      "type": "int",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.barrier0",
      "type": "void",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "llvm.nvvm.barrier0",
      "type": "void",
      "attrs": [],
      "args": [],
      "instrs": []
    },
    {
      "name": "kernel",
      "type": "void",
      "attrs": [],
      "args": [
        {
          "name": "M",
          "type": "int"
        },
        {
          "name": "N",
          "type": "int"
        },
        {
          "name": "K",
          "type": "int"
        },
        {
          "name": "alpha",
          "type": "float"
        },
        {
          "name": "A",
          "type": {
            "ptr": "float"
          }
        },
        {
          "name": "B",
          "type": {
            "ptr": "float"
          }
        },
        {
          "name": "beta",
          "type": "float"
        },
        {
          "name": "C",
          "type": {
            "ptr": "float"
          }
        }
      ],
      "instrs": [
        {
          "op": "const",
          "type": "int",
          "dest": "cRow",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "cCol",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "k",
          "value": null
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-fvjvleoy",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.y"
          ],
          "args": []
        },
        {
          "op": "id",
          "type": "int",
          "dest": "cRow",
          "args": [
            "tmp_clisp-fvjvleoy"
          ]
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-hotmbsah",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "id",
          "type": "int",
          "dest": "cCol",
          "args": [
            "tmp_clisp-hotmbsah"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "WARPSIZE",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-egjrlyhk",
          "value": 32
        },
        {
          "op": "id",
          "type": "int",
          "dest": "WARPSIZE",
          "args": [
            "tmp_clisp-egjrlyhk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "warpIdx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "warpCol",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "warpRow",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "threadIdxInWarp",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "threadColInWarp",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "threadRowInWarp",
          "value": null
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-vronpcus",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-kqfhnhbb",
          "args": [
            "tmp_clisp-vronpcus",
            "WARPSIZE"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "warpIdx",
          "args": [
            "tmp_clisp-kqfhnhbb"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pjtvcrce",
          "value": 128
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-msltedyy",
          "value": 64
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-dofzglnn",
          "args": [
            "tmp_clisp-pjtvcrce",
            "tmp_clisp-msltedyy"
          ]
        },
        {
          "op": "rem",
          "type": "int",
          "dest": "tmp_clisp-ohvietqf",
          "args": [
            "warpIdx",
            "tmp_clisp-dofzglnn"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "warpCol",
          "args": [
            "tmp_clisp-ohvietqf"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-diojfvuf",
          "value": 128
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-yfpylknh",
          "value": 64
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-arwbkkhc",
          "args": [
            "tmp_clisp-diojfvuf",
            "tmp_clisp-yfpylknh"
          ]
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-iomsfmpv",
          "args": [
            "warpIdx",
            "tmp_clisp-arwbkkhc"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "warpRow",
          "args": [
            "tmp_clisp-iomsfmpv"
          ]
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-hxqiqptp",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "rem",
          "type": "int",
          "dest": "tmp_clisp-cfpvomen",
          "args": [
            "tmp_clisp-hxqiqptp",
            "WARPSIZE"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "threadIdxInWarp",
          "args": [
            "tmp_clisp-cfpvomen"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rslrmpwf",
          "value": 32
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rodnbaor",
          "value": 8
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-cblcedto",
          "args": [
            "tmp_clisp-rslrmpwf",
            "tmp_clisp-rodnbaor"
          ]
        },
        {
          "op": "rem",
          "type": "int",
          "dest": "tmp_clisp-zpeonyqo",
          "args": [
            "threadIdxInWarp",
            "tmp_clisp-cblcedto"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "threadColInWarp",
          "args": [
            "tmp_clisp-zpeonyqo"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-kxizwonk",
          "value": 32
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-uqqexhkt",
          "value": 8
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-bvgussup",
          "args": [
            "tmp_clisp-kxizwonk",
            "tmp_clisp-uqqexhkt"
          ]
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-azdjnhwj",
          "args": [
            "threadIdxInWarp",
            "tmp_clisp-bvgussup"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "threadRowInWarp",
          "args": [
            "tmp_clisp-azdjnhwj"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cbtrydjf",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-vpeltmzg",
          "args": [
            "cRow",
            "tmp_clisp-cbtrydjf"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-lfcsgngd",
          "args": [
            "tmp_clisp-vpeltmzg",
            "K"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-vjoxywqx",
          "args": [
            "A",
            "tmp_clisp-lfcsgngd"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "A",
          "args": [
            "tmp_clisp-vjoxywqx"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-novxrgit",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-lduzuagn",
          "args": [
            "cCol",
            "tmp_clisp-novxrgit"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tnmzugcy",
          "args": [
            "B",
            "tmp_clisp-lduzuagn"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "B",
          "args": [
            "tmp_clisp-tnmzugcy"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-nzcblilo",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-nyguxjow",
          "args": [
            "cRow",
            "tmp_clisp-nzcblilo"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-jqpqimou",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-klxipops",
          "args": [
            "warpRow",
            "tmp_clisp-jqpqimou"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-pcwrxlzx",
          "args": [
            "tmp_clisp-nyguxjow",
            "tmp_clisp-klxipops"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-mzftnxsc",
          "args": [
            "tmp_clisp-pcwrxlzx",
            "N"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-txjaskuk",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-cxmtljtf",
          "args": [
            "cCol",
            "tmp_clisp-txjaskuk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hfjdrzbh",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-sxcngsso",
          "args": [
            "warpCol",
            "tmp_clisp-hfjdrzbh"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-zsamgksg",
          "args": [
            "tmp_clisp-cxmtljtf",
            "tmp_clisp-sxcngsso"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-qzsyykbv",
          "args": [
            "tmp_clisp-mzftnxsc",
            "tmp_clisp-zsamgksg"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-wsbbslmk",
          "args": [
            "C",
            "tmp_clisp-qzsyykbv"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "C",
          "args": [
            "tmp_clisp-wsbbslmk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "innerRowA",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "innerColA",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "innerRowB",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "innerColB",
          "value": null
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-tufyfdtz",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-lfaxrqzl",
          "value": 64
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cmoslbeo",
          "value": 4
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-wptoxotf",
          "args": [
            "tmp_clisp-lfaxrqzl",
            "tmp_clisp-cmoslbeo"
          ]
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-lnkrqomg",
          "args": [
            "tmp_clisp-tufyfdtz",
            "tmp_clisp-wptoxotf"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "innerRowA",
          "args": [
            "tmp_clisp-lnkrqomg"
          ]
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-dnuebfuu",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gsnzlrmb",
          "value": 64
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-tbfjhbsf",
          "value": 4
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-duslfjbm",
          "args": [
            "tmp_clisp-gsnzlrmb",
            "tmp_clisp-tbfjhbsf"
          ]
        },
        {
          "op": "rem",
          "type": "int",
          "dest": "tmp_clisp-tynclygp",
          "args": [
            "tmp_clisp-dnuebfuu",
            "tmp_clisp-duslfjbm"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "innerColA",
          "args": [
            "tmp_clisp-tynclygp"
          ]
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-ffmzyoyk",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-bffswneq",
          "value": 128
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-uwmdmdhd",
          "value": 4
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-nxujxjru",
          "args": [
            "tmp_clisp-bffswneq",
            "tmp_clisp-uwmdmdhd"
          ]
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-dlqtpthr",
          "args": [
            "tmp_clisp-ffmzyoyk",
            "tmp_clisp-nxujxjru"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "innerRowB",
          "args": [
            "tmp_clisp-dlqtpthr"
          ]
        },
        {
          "op": "call",
          "type": "int",
          "dest": "tmp_clisp-javfvmwh",
          "funcs": [
            "llvm.nvvm.read.ptx.sreg.tid.x"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-dquypdsm",
          "value": 128
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-sgjlcgtr",
          "value": 4
        },
        {
          "op": "div",
          "type": "int",
          "dest": "tmp_clisp-qacmzbau",
          "args": [
            "tmp_clisp-dquypdsm",
            "tmp_clisp-sgjlcgtr"
          ]
        },
        {
          "op": "rem",
          "type": "int",
          "dest": "tmp_clisp-nkfxblku",
          "args": [
            "tmp_clisp-javfvmwh",
            "tmp_clisp-qacmzbau"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "innerColB",
          "args": [
            "tmp_clisp-nkfxblku"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "size",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "idx",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "ptr": "float"
          },
          "dest": "threadResults",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": "size"
          },
          "dest": "regM",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": "size"
          },
          "dest": "regN",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "bkIdx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pzfagejg",
          "value": 1
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hhmtrstn",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-ryaeadab",
          "args": [
            "tmp_clisp-pzfagejg",
            "tmp_clisp-hhmtrstn"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vyyfdwmc",
          "value": 2
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-avnxvftn",
          "args": [
            "tmp_clisp-ryaeadab",
            "tmp_clisp-vyyfdwmc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-brfbwmso",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-okfbmuop",
          "args": [
            "tmp_clisp-avnxvftn",
            "tmp_clisp-brfbwmso"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "size",
          "args": [
            "tmp_clisp-okfbmuop"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-tzkzasiu",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-tzkzasiu"
          ]
        },
        {
          "label": "tmp_clisp.loop-wwlvceii"
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-yqnqewbu",
          "args": [
            "idx",
            "size"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-yqnqewbu"
          ],
          "labels": [
            "tmp_clisp.cont-fcoaeicq",
            "tmp_clisp.break-jeydrdjw"
          ]
        },
        {
          "label": "tmp_clisp.cont-fcoaeicq"
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ueamteov",
          "args": [
            "threadResults",
            "idx"
          ]
        },
        {
          "op": "const",
          "type": "float",
          "dest": "tmp_clisp-wyfkqvpe",
          "value": 0.0
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-ueamteov",
            "tmp_clisp-wyfkqvpe"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-btbugrag",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ejwnealq",
          "args": [
            "idx",
            "tmp_clisp-btbugrag"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-ejwnealq"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-wwlvceii"
          ]
        },
        {
          "label": "tmp_clisp.break-jeydrdjw"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-bpsmfpwi",
          "value": 1
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gpqlusyr",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-meukxkeb",
          "args": [
            "tmp_clisp-bpsmfpwi",
            "tmp_clisp-gpqlusyr"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "size",
          "args": [
            "tmp_clisp-meukxkeb"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vxcdclzo",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-vxcdclzo"
          ]
        },
        {
          "label": "tmp_clisp.loop-obvkqqbm"
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-njfxeyum",
          "args": [
            "idx",
            "size"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-njfxeyum"
          ],
          "labels": [
            "tmp_clisp.cont-tyzcwxbe",
            "tmp_clisp.break-balnhvps"
          ]
        },
        {
          "label": "tmp_clisp.cont-tyzcwxbe"
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-cgaofvfl",
          "args": [
            "regM"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tsrecvmo",
          "args": [
            "tmp_clisp-cgaofvfl",
            0,
            "idx"
          ]
        },
        {
          "op": "const",
          "type": "float",
          "dest": "tmp_clisp-mughkjsi",
          "value": 0.0
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-tsrecvmo",
            "tmp_clisp-mughkjsi"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rwrgvxhx",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-emgqtpvv",
          "args": [
            "idx",
            "tmp_clisp-rwrgvxhx"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-emgqtpvv"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-obvkqqbm"
          ]
        },
        {
          "label": "tmp_clisp.break-balnhvps"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ebpnlkak",
          "value": 2
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vjqywsbn",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-wjofdnnc",
          "args": [
            "tmp_clisp-ebpnlkak",
            "tmp_clisp-vjqywsbn"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "size",
          "args": [
            "tmp_clisp-wjofdnnc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-oouswpwn",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-oouswpwn"
          ]
        },
        {
          "label": "tmp_clisp.loop-dofzcmrc"
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-jrveofhp",
          "args": [
            "idx",
            "size"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-jrveofhp"
          ],
          "labels": [
            "tmp_clisp.cont-aqxrispc",
            "tmp_clisp.break-ndynphma"
          ]
        },
        {
          "label": "tmp_clisp.cont-aqxrispc"
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-fnyjfyga",
          "args": [
            "regN"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-qyarszbb",
          "args": [
            "tmp_clisp-fnyjfyga",
            0,
            "idx"
          ]
        },
        {
          "op": "const",
          "type": "float",
          "dest": "tmp_clisp-fokbqhba",
          "value": 0.0
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-qyarszbb",
            "tmp_clisp-fokbqhba"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-psomjxro",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-tyaqrluw",
          "args": [
            "idx",
            "tmp_clisp-psomjxro"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-tyaqrluw"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-dofzcmrc"
          ]
        },
        {
          "label": "tmp_clisp.break-ndynphma"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pyyjlkrn",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "bkIdx",
          "args": [
            "tmp_clisp-pyyjlkrn"
          ]
        },
        {
          "label": "tmp_clisp.loop-evpoylan"
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-ywktjnbd",
          "args": [
            "bkIdx",
            "K"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-ywktjnbd"
          ],
          "labels": [
            "tmp_clisp.cont-uvliaeib",
            "tmp_clisp.break-euvvhdqw"
          ]
        },
        {
          "label": "tmp_clisp.cont-uvliaeib"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "offset.kjgaxsnx.ybyxffzp",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "tmp.kjgaxsnx.ybyxffzp",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-fomwrgvn",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "offset.kjgaxsnx.ybyxffzp",
          "args": [
            "tmp_clisp-fomwrgvn"
          ]
        },
        {
          "label": "tmp_clisp.loop-lmdmhzgs"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-whnnghxw",
          "value": 16
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-lpweyzgz",
          "args": [
            "offset.kjgaxsnx.ybyxffzp",
            "tmp_clisp-whnnghxw"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-svxbxvqw",
          "value": 128
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-zfgcxmuv",
          "args": [
            "tmp_clisp-lpweyzgz",
            "tmp_clisp-svxbxvqw"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-zfgcxmuv"
          ],
          "labels": [
            "tmp_clisp.cont-cpbripcy",
            "tmp_clisp.break-xvtwchuf"
          ]
        },
        {
          "label": "tmp_clisp.cont-cpbripcy"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "idx.kjgaxsnx.ybyxffzp.zphmmoqd",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-uzewcayy",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx.kjgaxsnx.ybyxffzp.zphmmoqd",
          "args": [
            "tmp_clisp-uzewcayy"
          ]
        },
        {
          "label": "tmp_clisp.loop-ntqxchbd"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-oudmttaf",
          "value": 4
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-tenhpocf",
          "args": [
            "idx.kjgaxsnx.ybyxffzp.zphmmoqd",
            "tmp_clisp-oudmttaf"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-tenhpocf"
          ],
          "labels": [
            "tmp_clisp.cont-xcihixwk",
            "tmp_clisp.break-yjrlelys"
          ]
        },
        {
          "label": "tmp_clisp.cont-xcihixwk"
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-xklciwju",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tsvljseo",
          "args": [
            "tmp_clisp-xklciwju",
            0,
            "idx.kjgaxsnx.ybyxffzp.zphmmoqd"
          ]
        },
        {
          "op": "const",
          "type": "float",
          "dest": "tmp_clisp-lwrdiumk",
          "value": 0.0
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-tsvljseo",
            "tmp_clisp-lwrdiumk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ckuviyeu",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-bowxqbvb",
          "args": [
            "idx.kjgaxsnx.ybyxffzp.zphmmoqd",
            "tmp_clisp-ckuviyeu"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx.kjgaxsnx.ybyxffzp.zphmmoqd",
          "args": [
            "tmp_clisp-bowxqbvb"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-ntqxchbd"
          ]
        },
        {
          "label": "tmp_clisp.break-yjrlelys"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-onmfider",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-nifkgvuv",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tfaoyzyl",
          "args": [
            "tmp_clisp-nifkgvuv",
            0,
            "tmp_clisp-onmfider"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-ebbysfsr",
          "args": [
            "tmp_clisp-tfaoyzyl",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-rebsjloy",
          "args": [
            "innerRowA",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-ljicguzl",
          "args": [
            "tmp_clisp-rebsjloy",
            "K"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cucxshoz",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-rvhstirv",
          "args": [
            "innerColA",
            "tmp_clisp-cucxshoz"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-jbqnvxko",
          "args": [
            "tmp_clisp-ljicguzl",
            "tmp_clisp-rvhstirv"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-twblkppj",
          "args": [
            "A",
            "tmp_clisp-jbqnvxko"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-rpalissu",
          "args": [
            "tmp_clisp-twblkppj",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-pfzhmnkv",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-ebbysfsr",
            "tmp_clisp-rpalissu"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-idkdcdin",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-hfrvyfya",
          "args": [
            "innerColA",
            "tmp_clisp-idkdcdin"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qrjufksg",
          "value": 0
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-sxwdfkak",
          "args": [
            "tmp_clisp-hfrvyfya",
            "tmp_clisp-qrjufksg"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pgobtyps",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-earjqfqs",
          "args": [
            "tmp_clisp-sxwdfkak",
            "tmp_clisp-pgobtyps"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-depuzxjs",
          "args": [
            "innerRowA",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-jbmfemuu",
          "args": [
            "tmp_clisp-earjqfqs",
            "tmp_clisp-depuzxjs"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-aasfwyim",
          "args": [
            "As",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-apnntsuu",
          "args": [
            "tmp_clisp-aasfwyim",
            0,
            "tmp_clisp-jbmfemuu"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gsqtwpmh",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-azeaegih",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-krhlssbs",
          "args": [
            "tmp_clisp-azeaegih",
            0,
            "tmp_clisp-gsqtwpmh"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-xcpnxbol",
          "args": [
            "tmp_clisp-krhlssbs"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-apnntsuu",
            "tmp_clisp-xcpnxbol"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-waugftsg",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-wylajeqz",
          "args": [
            "innerColA",
            "tmp_clisp-waugftsg"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-tpmcepcj",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-vfpywpjy",
          "args": [
            "tmp_clisp-wylajeqz",
            "tmp_clisp-tpmcepcj"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-bpjblccl",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-qnbdvruz",
          "args": [
            "tmp_clisp-vfpywpjy",
            "tmp_clisp-bpjblccl"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-febzhvnb",
          "args": [
            "innerRowA",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-cjzbnlkq",
          "args": [
            "tmp_clisp-qnbdvruz",
            "tmp_clisp-febzhvnb"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-rraohrcm",
          "args": [
            "As",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tttjmima",
          "args": [
            "tmp_clisp-rraohrcm",
            0,
            "tmp_clisp-cjzbnlkq"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rwlivrbb",
          "value": 1
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-lpdxlhkb",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ksvojkff",
          "args": [
            "tmp_clisp-lpdxlhkb",
            0,
            "tmp_clisp-rwlivrbb"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-ujxaqjdx",
          "args": [
            "tmp_clisp-ksvojkff"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-tttjmima",
            "tmp_clisp-ujxaqjdx"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-xwlbesai",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-hlratjrv",
          "args": [
            "innerColA",
            "tmp_clisp-xwlbesai"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-mvwrumto",
          "value": 2
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-kxavejgl",
          "args": [
            "tmp_clisp-hlratjrv",
            "tmp_clisp-mvwrumto"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-luqjnwdo",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-ehmrkvvj",
          "args": [
            "tmp_clisp-kxavejgl",
            "tmp_clisp-luqjnwdo"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-hsvnazch",
          "args": [
            "innerRowA",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-mywgfbcl",
          "args": [
            "tmp_clisp-ehmrkvvj",
            "tmp_clisp-hsvnazch"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-bucanhwc",
          "args": [
            "As",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ldvfxvtv",
          "args": [
            "tmp_clisp-bucanhwc",
            0,
            "tmp_clisp-mywgfbcl"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rvnpidar",
          "value": 2
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-yymuickt",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-dzgsztuc",
          "args": [
            "tmp_clisp-yymuickt",
            0,
            "tmp_clisp-rvnpidar"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-djwhhoep",
          "args": [
            "tmp_clisp-dzgsztuc"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-ldvfxvtv",
            "tmp_clisp-djwhhoep"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vzkyjgnb",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-nenieyle",
          "args": [
            "innerColA",
            "tmp_clisp-vzkyjgnb"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-sxyzzjvs",
          "value": 3
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-uuqrmgpm",
          "args": [
            "tmp_clisp-nenieyle",
            "tmp_clisp-sxyzzjvs"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wdibfmrv",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-deqxhihd",
          "args": [
            "tmp_clisp-uuqrmgpm",
            "tmp_clisp-wdibfmrv"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-bzzbwnmu",
          "args": [
            "innerRowA",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-qwbyxden",
          "args": [
            "tmp_clisp-deqxhihd",
            "tmp_clisp-bzzbwnmu"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-rnatgfvx",
          "args": [
            "As",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-jbhnkjot",
          "args": [
            "tmp_clisp-rnatgfvx",
            0,
            "tmp_clisp-qwbyxden"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gcbtetiy",
          "value": 3
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-yreysgmi",
          "args": [
            "tmp.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-kiqtlubv",
          "args": [
            "tmp_clisp-yreysgmi",
            0,
            "tmp_clisp-gcbtetiy"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-pnsmvoln",
          "args": [
            "tmp_clisp-kiqtlubv"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-jbhnkjot",
            "tmp_clisp-pnsmvoln"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ratqhzww",
          "value": 16
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-skkpsufz",
          "args": [
            "offset.kjgaxsnx.ybyxffzp",
            "tmp_clisp-ratqhzww"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "offset.kjgaxsnx.ybyxffzp",
          "args": [
            "tmp_clisp-skkpsufz"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-lmdmhzgs"
          ]
        },
        {
          "label": "tmp_clisp.break-xvtwchuf"
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "first_dest.kjgaxsnx.ybyxffzp",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "second_dest.kjgaxsnx.ybyxffzp",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-uwudrxuy",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "offset.kjgaxsnx.ybyxffzp",
          "args": [
            "tmp_clisp-uwudrxuy"
          ]
        },
        {
          "label": "tmp_clisp.loop-krhkrmba"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-frgtltyf",
          "value": 8
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-wzbqohew",
          "args": [
            "offset.kjgaxsnx.ybyxffzp",
            "tmp_clisp-frgtltyf"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-voucyyuh",
          "value": 64
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-pdbfuyvf",
          "args": [
            "tmp_clisp-wzbqohew",
            "tmp_clisp-voucyyuh"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-pdbfuyvf"
          ],
          "labels": [
            "tmp_clisp.cont-ywpofboy",
            "tmp_clisp.break-hbpsfchw"
          ]
        },
        {
          "label": "tmp_clisp.cont-ywpofboy"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-dgduswvl",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-ngroosrx",
          "args": [
            "second_dest.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-fqikgqrg",
          "args": [
            "tmp_clisp-ngroosrx",
            0,
            "tmp_clisp-dgduswvl"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-jvoyalai",
          "args": [
            "tmp_clisp-fqikgqrg",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-qidtnnjn",
          "args": [
            "innerRowB",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cjfyledc",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-muifhbki",
          "args": [
            "tmp_clisp-qidtnnjn",
            "tmp_clisp-cjfyledc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ynmqcxwi",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-xzxvkwmh",
          "args": [
            "innerColB",
            "tmp_clisp-ynmqcxwi"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-uaxjhjha",
          "args": [
            "tmp_clisp-muifhbki",
            "tmp_clisp-xzxvkwmh"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-gfgadiip",
          "args": [
            "B",
            "tmp_clisp-uaxjhjha"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-dlzcsvrw",
          "args": [
            "tmp_clisp-gfgadiip",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-zmvkdmnn",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-jvoyalai",
            "tmp_clisp-dlzcsvrw"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ynszwybx",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-sqbtndps",
          "args": [
            "first_dest.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-lkaqtdnr",
          "args": [
            "tmp_clisp-sqbtndps",
            0,
            "tmp_clisp-ynszwybx"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-fmzcidew",
          "args": [
            "tmp_clisp-lkaqtdnr",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-wviljtrz",
          "args": [
            "innerRowB",
            "offset.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hvdnnkyg",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-mctnddop",
          "args": [
            "tmp_clisp-wviljtrz",
            "tmp_clisp-hvdnnkyg"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-kkzesbaq",
          "value": 4
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-wpuinxie",
          "args": [
            "innerColB",
            "tmp_clisp-kkzesbaq"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-emjzbsls",
          "args": [
            "tmp_clisp-mctnddop",
            "tmp_clisp-wpuinxie"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-eqzviftg",
          "args": [
            "Bs",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-orwlpasj",
          "args": [
            "tmp_clisp-eqzviftg",
            0,
            "tmp_clisp-emjzbsls"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-qztecgcp",
          "args": [
            "tmp_clisp-orwlpasj",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-kkyokdlw",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-fmzcidew",
            "tmp_clisp-qztecgcp"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-fwdvrbqv",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-jsleyocu",
          "args": [
            "first_dest.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-xsiclttx",
          "args": [
            "tmp_clisp-jsleyocu",
            0,
            "tmp_clisp-fwdvrbqv"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-zjxioznz",
          "args": [
            "tmp_clisp-xsiclttx",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ccqlpolm",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-mzbsdbwg",
          "args": [
            "second_dest.kjgaxsnx.ybyxffzp"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-uflthwbg",
          "args": [
            "tmp_clisp-mzbsdbwg",
            0,
            "tmp_clisp-ccqlpolm"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-skpnwaon",
          "args": [
            "tmp_clisp-uflthwbg",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-acyimaxy",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-zjxioznz",
            "tmp_clisp-skpnwaon"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ethcobdz",
          "value": 8
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-dcwybdpo",
          "args": [
            "offset.kjgaxsnx.ybyxffzp",
            "tmp_clisp-ethcobdz"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "offset.kjgaxsnx.ybyxffzp",
          "args": [
            "tmp_clisp-dcwybdpo"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-krhkrmba"
          ]
        },
        {
          "label": "tmp_clisp.break-hbpsfchw"
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-hwnnfqsx",
          "funcs": [
            "llvm.nvvm.barrier0"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "dotIdx.kjgaxsnx.bwqgzknx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "wSubRowIdx.kjgaxsnx.bwqgzknx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "wSubColIdx.kjgaxsnx.bwqgzknx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "i.kjgaxsnx.bwqgzknx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-otvqksyc",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "dotIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-otvqksyc"
          ]
        },
        {
          "label": "tmp_clisp.loop-murpfqcc"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-yrfkpuoo",
          "value": 64
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-nmtohzov",
          "args": [
            "dotIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-yrfkpuoo"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-nmtohzov"
          ],
          "labels": [
            "tmp_clisp.cont-dbhxsayb",
            "tmp_clisp.break-ynksxivw"
          ]
        },
        {
          "label": "tmp_clisp.cont-dbhxsayb"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-mttqloqn",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-mttqloqn"
          ]
        },
        {
          "label": "tmp_clisp.loop-txpbdbrz"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-sszkptkk",
          "value": 1
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-rlrucgej",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-sszkptkk"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-rlrucgej"
          ],
          "labels": [
            "tmp_clisp.cont-vfhvmkcx",
            "tmp_clisp.break-yrndgywp"
          ]
        },
        {
          "label": "tmp_clisp.cont-vfhvmkcx"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-camnrcfm",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "i.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-camnrcfm"
          ]
        },
        {
          "label": "tmp_clisp.loop-nvwmxmzi"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-avmqfzoe",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-wkotdpau",
          "args": [
            "i.kjgaxsnx.bwqgzknx",
            "tmp_clisp-avmqfzoe"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-wkotdpau"
          ],
          "labels": [
            "tmp_clisp.cont-eojonysb",
            "tmp_clisp.break-mvbmczvw"
          ]
        },
        {
          "label": "tmp_clisp.cont-eojonysb"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-upjfibnk",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-cjndodzy",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-upjfibnk"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-whlhrcrr",
          "args": [
            "tmp_clisp-cjndodzy",
            "i.kjgaxsnx.bwqgzknx"
          ]
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-erziycgw",
          "args": [
            "regM"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-odvkgquj",
          "args": [
            "tmp_clisp-erziycgw",
            0,
            "tmp_clisp-whlhrcrr"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-xlzjqngj",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-bnszquzs",
          "args": [
            "dotIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-xlzjqngj"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gmxuatza",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-fykiqvbc",
          "args": [
            "warpRow",
            "tmp_clisp-gmxuatza"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-qanmzabb",
          "args": [
            "tmp_clisp-bnszquzs",
            "tmp_clisp-fykiqvbc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cdkriprs",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-rcinmdzt",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-cdkriprs"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-rrfezwsf",
          "args": [
            "tmp_clisp-qanmzabb",
            "tmp_clisp-rcinmdzt"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ufsyetmx",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-dpkjcstm",
          "args": [
            "threadColInWarp",
            "tmp_clisp-ufsyetmx"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-uhlkxszt",
          "args": [
            "tmp_clisp-dpkjcstm",
            "i.kjgaxsnx.bwqgzknx"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-chdstqql",
          "args": [
            "tmp_clisp-rrfezwsf",
            "tmp_clisp-uhlkxszt"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-whvthntl",
          "args": [
            "As",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-zqwpauxp",
          "args": [
            "tmp_clisp-whvthntl",
            0,
            "tmp_clisp-chdstqql"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-hmtqgwqm",
          "args": [
            "tmp_clisp-zqwpauxp"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-odvkgquj",
            "tmp_clisp-hmtqgwqm"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vmlpqoox",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-bhqcoyet",
          "args": [
            "i.kjgaxsnx.bwqgzknx",
            "tmp_clisp-vmlpqoox"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "i.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-bhqcoyet"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-nvwmxmzi"
          ]
        },
        {
          "label": "tmp_clisp.break-mvbmczvw"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ecjkcney",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-omqqrcnp",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-ecjkcney"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-omqqrcnp"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-txpbdbrz"
          ]
        },
        {
          "label": "tmp_clisp.break-yrndgywp"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ywnahiyf",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-ywnahiyf"
          ]
        },
        {
          "label": "tmp_clisp.loop-oburpstw"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-vhndntqz",
          "value": 2
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-uwokvlob",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-vhndntqz"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-uwokvlob"
          ],
          "labels": [
            "tmp_clisp.cont-osviidzq",
            "tmp_clisp.break-jxmnyppo"
          ]
        },
        {
          "label": "tmp_clisp.cont-osviidzq"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-yjjawrto",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "i.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-yjjawrto"
          ]
        },
        {
          "label": "tmp_clisp.loop-dakiowjk"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qcmkytmi",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-lwdbmwor",
          "args": [
            "i.kjgaxsnx.bwqgzknx",
            "tmp_clisp-qcmkytmi"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-lwdbmwor"
          ],
          "labels": [
            "tmp_clisp.cont-inbmlobt",
            "tmp_clisp.break-tvfjimua"
          ]
        },
        {
          "label": "tmp_clisp.cont-inbmlobt"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-usmpcfuf",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-znoikfsl",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-usmpcfuf"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-yyjdsern",
          "args": [
            "tmp_clisp-znoikfsl",
            "i.kjgaxsnx.bwqgzknx"
          ]
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-fpboqsxb",
          "args": [
            "regN"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-jjxsclug",
          "args": [
            "tmp_clisp-fpboqsxb",
            0,
            "tmp_clisp-yyjdsern"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qqewvwlj",
          "value": 128
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-zampfumi",
          "args": [
            "dotIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-qqewvwlj"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-lejbcyzb",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-utkfxuiy",
          "args": [
            "warpCol",
            "tmp_clisp-lejbcyzb"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-kbcnwlzs",
          "args": [
            "tmp_clisp-zampfumi",
            "tmp_clisp-utkfxuiy"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-nysrwwqv",
          "value": 32
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-ifxrexlk",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-nysrwwqv"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-htrixwpd",
          "args": [
            "tmp_clisp-kbcnwlzs",
            "tmp_clisp-ifxrexlk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-yyutfltx",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-wsjpniam",
          "args": [
            "threadColInWarp",
            "tmp_clisp-yyutfltx"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-jzvvvmzs",
          "args": [
            "tmp_clisp-wsjpniam",
            "i.kjgaxsnx.bwqgzknx"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-xkzsvxcs",
          "args": [
            "tmp_clisp-htrixwpd",
            "tmp_clisp-jzvvvmzs"
          ]
        },
        {
          "op": "addrspacecast",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 8192
            }
          },
          "dest": "tmp_clisp-gkxskmlo",
          "args": [
            "Bs",
            [
              "ptr",
              [
                "arr",
                8192,
                "float"
              ]
            ]
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-mkfwbgvt",
          "args": [
            "tmp_clisp-gkxskmlo",
            0,
            "tmp_clisp-xkzsvxcs"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-ytdczdys",
          "args": [
            "tmp_clisp-mkfwbgvt"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-jjxsclug",
            "tmp_clisp-ytdczdys"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pgffxxep",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-eskohzld",
          "args": [
            "i.kjgaxsnx.bwqgzknx",
            "tmp_clisp-pgffxxep"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "i.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-eskohzld"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-dakiowjk"
          ]
        },
        {
          "label": "tmp_clisp.break-tvfjimua"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-jdmcjthp",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-glffaita",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-jdmcjthp"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-glffaita"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-oburpstw"
          ]
        },
        {
          "label": "tmp_clisp.break-jxmnyppo"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ldlwlmik",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-ldlwlmik"
          ]
        },
        {
          "label": "tmp_clisp.loop-lugurytq"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ywrganuw",
          "value": 1
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-swfhdkso",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-ywrganuw"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-swfhdkso"
          ],
          "labels": [
            "tmp_clisp.cont-qraffqkn",
            "tmp_clisp.break-sxjnidof"
          ]
        },
        {
          "label": "tmp_clisp.cont-qraffqkn"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-asuwtmql",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-asuwtmql"
          ]
        },
        {
          "label": "tmp_clisp.loop-cvzgbeeo"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wqawczit",
          "value": 2
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-hdlfvhwo",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-wqawczit"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-hdlfvhwo"
          ],
          "labels": [
            "tmp_clisp.cont-rdcsjoxy",
            "tmp_clisp.break-ofrbeahh"
          ]
        },
        {
          "label": "tmp_clisp.cont-rdcsjoxy"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-jnsycpdu",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb",
          "args": [
            "tmp_clisp-jnsycpdu"
          ]
        },
        {
          "label": "tmp_clisp.loop-yoceibba"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-womafyqr",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-nxfphvti",
          "args": [
            "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb",
            "tmp_clisp-womafyqr"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-nxfphvti"
          ],
          "labels": [
            "tmp_clisp.cont-wbzvlorp",
            "tmp_clisp.break-tgscmexe"
          ]
        },
        {
          "label": "tmp_clisp.cont-wbzvlorp"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-frzixzdf",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb",
          "args": [
            "tmp_clisp-frzixzdf"
          ]
        },
        {
          "label": "tmp_clisp.loop-ufcnhmch"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qjtslqdy",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-fxbtgexe",
          "args": [
            "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb",
            "tmp_clisp-qjtslqdy"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-fxbtgexe"
          ],
          "labels": [
            "tmp_clisp.cont-gmohbqqz",
            "tmp_clisp.break-offdxpgz"
          ]
        },
        {
          "label": "tmp_clisp.cont-gmohbqqz"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-xhmpjqna",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-dkhocgbw",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-xhmpjqna"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-iwaboozg",
          "args": [
            "tmp_clisp-dkhocgbw",
            "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gzxgacfp",
          "value": 2
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qxrjizch",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-beadxmpy",
          "args": [
            "tmp_clisp-gzxgacfp",
            "tmp_clisp-qxrjizch"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-mkisrccg",
          "args": [
            "tmp_clisp-iwaboozg",
            "tmp_clisp-beadxmpy"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-dmvqwlsb",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-lqwmnogz",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-dmvqwlsb"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-egtweutz",
          "args": [
            "tmp_clisp-mkisrccg",
            "tmp_clisp-lqwmnogz"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-dzokqtlc",
          "args": [
            "tmp_clisp-egtweutz",
            "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-anpunvir",
          "args": [
            "threadResults",
            "tmp_clisp-dzokqtlc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wxgrubqa",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-jsksodnz",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-wxgrubqa"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-mbtaylmf",
          "args": [
            "tmp_clisp-jsksodnz",
            "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-aesgjfnd",
          "value": 2
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wulcrpkl",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-tgdoootf",
          "args": [
            "tmp_clisp-aesgjfnd",
            "tmp_clisp-wulcrpkl"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-mitrmwim",
          "args": [
            "tmp_clisp-mbtaylmf",
            "tmp_clisp-tgdoootf"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-fujkuddh",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-qvgfhffc",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-fujkuddh"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-oknwjpsp",
          "args": [
            "tmp_clisp-mitrmwim",
            "tmp_clisp-qvgfhffc"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-otexlesa",
          "args": [
            "tmp_clisp-oknwjpsp",
            "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-oqpuvixn",
          "args": [
            "threadResults",
            "tmp_clisp-otexlesa"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-jtxteixq",
          "args": [
            "tmp_clisp-oqpuvixn"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rxbwtafi",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-vxbmecdj",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-rxbwtafi"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-zggrkhrm",
          "args": [
            "tmp_clisp-vxbmecdj",
            "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-hbxnoexl",
          "args": [
            "regM"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tvgyyouk",
          "args": [
            "tmp_clisp-hbxnoexl",
            0,
            "tmp_clisp-zggrkhrm"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-kifvftol",
          "args": [
            "tmp_clisp-tvgyyouk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-stzvdlei",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-jedtqnrp",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-stzvdlei"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ipvmlqhy",
          "args": [
            "tmp_clisp-jedtqnrp",
            "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb"
          ]
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": "size"
            }
          },
          "dest": "tmp_clisp-xcititdg",
          "args": [
            "regN"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-mcwyahxi",
          "args": [
            "tmp_clisp-xcititdg",
            0,
            "tmp_clisp-ipvmlqhy"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-dgfuxnck",
          "args": [
            "tmp_clisp-mcwyahxi"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-fwzkysrh",
          "args": [
            "tmp_clisp-kifvftol",
            "tmp_clisp-dgfuxnck"
          ]
        },
        {
          "op": "fadd",
          "type": "float",
          "dest": "tmp_clisp-hkmqkhyq",
          "args": [
            "tmp_clisp-jtxteixq",
            "tmp_clisp-fwzkysrh"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-anpunvir",
            "tmp_clisp-hkmqkhyq"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-qihmnptu",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-wkeplvlb",
          "args": [
            "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb",
            "tmp_clisp-qihmnptu"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxN.kjgaxsnx.bwqgzknx.cumdoftb",
          "args": [
            "tmp_clisp-wkeplvlb"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-ufcnhmch"
          ]
        },
        {
          "label": "tmp_clisp.break-offdxpgz"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-oyigilrx",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-hlrcwyeh",
          "args": [
            "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb",
            "tmp_clisp-oyigilrx"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxM.kjgaxsnx.bwqgzknx.cumdoftb",
          "args": [
            "tmp_clisp-hlrcwyeh"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-yoceibba"
          ]
        },
        {
          "label": "tmp_clisp.break-tgscmexe"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ynaudbuj",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ykqwvrbc",
          "args": [
            "wSubColIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-ynaudbuj"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-ykqwvrbc"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-cvzgbeeo"
          ]
        },
        {
          "label": "tmp_clisp.break-ofrbeahh"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ynapiwnr",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-lqtvrqkr",
          "args": [
            "wSubRowIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-ynapiwnr"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-lqtvrqkr"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-lugurytq"
          ]
        },
        {
          "label": "tmp_clisp.break-sxjnidof"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ireeeaxw",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-lhbaezzt",
          "args": [
            "dotIdx.kjgaxsnx.bwqgzknx",
            "tmp_clisp-ireeeaxw"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "dotIdx.kjgaxsnx.bwqgzknx",
          "args": [
            "tmp_clisp-lhbaezzt"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-murpfqcc"
          ]
        },
        {
          "label": "tmp_clisp.break-ynksxivw"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ufiraicl",
          "value": 64
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-aqzoydwc",
          "args": [
            "A",
            "tmp_clisp-ufiraicl"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "A",
          "args": [
            "tmp_clisp-aqzoydwc"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rylnhjir",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-fbkynzwi",
          "args": [
            "tmp_clisp-rylnhjir",
            "N"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ocsfpmpl",
          "args": [
            "B",
            "tmp_clisp-fbkynzwi"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "B",
          "args": [
            "tmp_clisp-ocsfpmpl"
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-vsxhpqex",
          "funcs": [
            "llvm.nvvm.barrier0"
          ],
          "args": []
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pvxwlpxn",
          "value": 64
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-plcfsgry",
          "args": [
            "bkIdx",
            "tmp_clisp-pvxwlpxn"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "bkIdx",
          "args": [
            "tmp_clisp-plcfsgry"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-evpoylan"
          ]
        },
        {
          "label": "tmp_clisp.break-euvvhdqw"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "wSubRowIdx",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "wSubColIdx",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "ptr": "float"
          },
          "dest": "C_interim",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hknfugbb",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx",
          "args": [
            "tmp_clisp-hknfugbb"
          ]
        },
        {
          "label": "tmp_clisp.loop-tmaefhiu"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-eyanlyak",
          "value": 1
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-qokldeuj",
          "args": [
            "wSubRowIdx",
            "tmp_clisp-eyanlyak"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-qokldeuj"
          ],
          "labels": [
            "tmp_clisp.cont-wwsyiaww",
            "tmp_clisp.break-rysknbac"
          ]
        },
        {
          "label": "tmp_clisp.cont-wwsyiaww"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-uqplphnh",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx",
          "args": [
            "tmp_clisp-uqplphnh"
          ]
        },
        {
          "label": "tmp_clisp.loop-dqfjchwq"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-cgtfsssp",
          "value": 2
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-fmbacvmu",
          "args": [
            "wSubColIdx",
            "tmp_clisp-cgtfsssp"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-fmbacvmu"
          ],
          "labels": [
            "tmp_clisp.cont-ufprbkpv",
            "tmp_clisp.break-bpngaigi"
          ]
        },
        {
          "label": "tmp_clisp.cont-ufprbkpv"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hmkuaeih",
          "value": 64
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-lixefcqd",
          "args": [
            "wSubRowIdx",
            "tmp_clisp-hmkuaeih"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-mmslanvc",
          "args": [
            "tmp_clisp-lixefcqd",
            "N"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wxsoalnm",
          "value": 32
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-syfmqbjh",
          "args": [
            "wSubColIdx",
            "tmp_clisp-wxsoalnm"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-bhnqtard",
          "args": [
            "tmp_clisp-mmslanvc",
            "tmp_clisp-syfmqbjh"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-pgqgkslk",
          "args": [
            "C",
            "tmp_clisp-bhnqtard"
          ]
        },
        {
          "op": "id",
          "type": {
            "ptr": "float"
          },
          "dest": "C_interim",
          "args": [
            "tmp_clisp-pgqgkslk"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "resIdxM.vheynmha.rsrmyppv",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-eelrfqyl",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxM.vheynmha.rsrmyppv",
          "args": [
            "tmp_clisp-eelrfqyl"
          ]
        },
        {
          "label": "tmp_clisp.loop-hkqcyuvd"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-engbgjvb",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-dpdobcwp",
          "args": [
            "resIdxM.vheynmha.rsrmyppv",
            "tmp_clisp-engbgjvb"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-dpdobcwp"
          ],
          "labels": [
            "tmp_clisp.cont-obizizlr",
            "tmp_clisp.break-tgnxwkbc"
          ]
        },
        {
          "label": "tmp_clisp.cont-obizizlr"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "resIdxN.vheynmha.rsrmyppv.tldyvvun",
          "value": null
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "tmp.vheynmha.rsrmyppv.tldyvvun",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hufxljen",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxN.vheynmha.rsrmyppv.tldyvvun",
          "args": [
            "tmp_clisp-hufxljen"
          ]
        },
        {
          "label": "tmp_clisp.loop-ujiylyew"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-seenecab",
          "value": 8
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-uosppllk",
          "args": [
            "resIdxN.vheynmha.rsrmyppv.tldyvvun",
            "tmp_clisp-seenecab"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-uosppllk"
          ],
          "labels": [
            "tmp_clisp.cont-okuvdnur",
            "tmp_clisp.break-ihntwsrr"
          ]
        },
        {
          "label": "tmp_clisp.cont-okuvdnur"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-crunkssk",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-vnedlcvf",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-uyumaeub",
          "args": [
            "tmp_clisp-vnedlcvf",
            0,
            "tmp_clisp-crunkssk"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-vzygdhzc",
          "args": [
            "tmp_clisp-uyumaeub",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ybptbtor",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-pwpospjp",
          "args": [
            "threadRowInWarp",
            "tmp_clisp-ybptbtor"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-byerzrcs",
          "args": [
            "tmp_clisp-pwpospjp",
            "resIdxM.vheynmha.rsrmyppv"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-vgjaazvn",
          "args": [
            "tmp_clisp-byerzrcs",
            "N"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-dthvwwvr",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-waygdpxe",
          "args": [
            "threadColInWarp",
            "tmp_clisp-dthvwwvr"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-boujjqpi",
          "args": [
            "tmp_clisp-waygdpxe",
            "resIdxN.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-jnzihfcy",
          "args": [
            "tmp_clisp-vgjaazvn",
            "tmp_clisp-boujjqpi"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-tnisjcdo",
          "args": [
            "C_interim",
            "tmp_clisp-jnzihfcy"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-raxahvrn",
          "args": [
            "tmp_clisp-tnisjcdo",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-bgkvbyrr",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-vzygdhzc",
            "tmp_clisp-raxahvrn"
          ]
        },
        {
          "op": "id",
          "type": "void",
          "dest": "tmp.vheynmha.rsrmyppv.tldyvvun",
          "args": [
            "tmp_clisp-bgkvbyrr"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-xdvbisfr",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-uvlgytji",
          "args": [
            "wSubRowIdx",
            "tmp_clisp-xdvbisfr"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-eqgxfekl",
          "args": [
            "tmp_clisp-uvlgytji",
            "resIdxM.vheynmha.rsrmyppv"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-eqsbioyp",
          "value": 2
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-fwmrdeqb",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-ctjovgin",
          "args": [
            "tmp_clisp-eqsbioyp",
            "tmp_clisp-fwmrdeqb"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-dnccuiji",
          "args": [
            "tmp_clisp-eqgxfekl",
            "tmp_clisp-ctjovgin"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-jytyrpqy",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-npinfpue",
          "args": [
            "wSubColIdx",
            "tmp_clisp-jytyrpqy"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-vnwhtmpu",
          "args": [
            "tmp_clisp-npinfpue",
            "resIdxN.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-jnqvgnlq",
          "args": [
            "tmp_clisp-dnccuiji",
            "tmp_clisp-vnwhtmpu"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
          "args": [
            "tmp_clisp-jnqvgnlq"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-otxvpapm",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-uijzwtjf",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-rhxkhgnx",
          "args": [
            "tmp_clisp-uijzwtjf",
            0,
            "tmp_clisp-otxvpapm"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wpgnlktd",
          "value": 0
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-dgzpuena",
          "args": [
            "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
            "tmp_clisp-wpgnlktd"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-pvhgqwly",
          "args": [
            "threadResults",
            "tmp_clisp-dgzpuena"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-ffgzeauf",
          "args": [
            "tmp_clisp-pvhgqwly"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-sordlwrg",
          "args": [
            "alpha",
            "tmp_clisp-ffgzeauf"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-jporsuqq",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-ombzsutq",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ijtjvdhi",
          "args": [
            "tmp_clisp-ombzsutq",
            0,
            "tmp_clisp-jporsuqq"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-cnexmlau",
          "args": [
            "tmp_clisp-ijtjvdhi"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-kfdkkber",
          "args": [
            "beta",
            "tmp_clisp-cnexmlau"
          ]
        },
        {
          "op": "fadd",
          "type": "float",
          "dest": "tmp_clisp-nigjetht",
          "args": [
            "tmp_clisp-sordlwrg",
            "tmp_clisp-kfdkkber"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-rhxkhgnx",
            "tmp_clisp-nigjetht"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-kuyccgtp",
          "value": 1
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-ontyvswn",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-bmkjpgom",
          "args": [
            "tmp_clisp-ontyvswn",
            0,
            "tmp_clisp-kuyccgtp"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-gtwxgheh",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ngmnyswg",
          "args": [
            "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
            "tmp_clisp-gtwxgheh"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-ptfkvucy",
          "args": [
            "threadResults",
            "tmp_clisp-ngmnyswg"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-lkcaevsp",
          "args": [
            "tmp_clisp-ptfkvucy"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-cbydtvbr",
          "args": [
            "alpha",
            "tmp_clisp-lkcaevsp"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-fyzcokzl",
          "value": 1
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-gbdrqzws",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-mmboruha",
          "args": [
            "tmp_clisp-gbdrqzws",
            0,
            "tmp_clisp-fyzcokzl"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-gknnfpma",
          "args": [
            "tmp_clisp-mmboruha"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-ddjleqem",
          "args": [
            "beta",
            "tmp_clisp-gknnfpma"
          ]
        },
        {
          "op": "fadd",
          "type": "float",
          "dest": "tmp_clisp-wrywuyqh",
          "args": [
            "tmp_clisp-cbydtvbr",
            "tmp_clisp-ddjleqem"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-bmkjpgom",
            "tmp_clisp-wrywuyqh"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-pjybmjki",
          "value": 2
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-jnsuzjxq",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-gkceoknv",
          "args": [
            "tmp_clisp-jnsuzjxq",
            0,
            "tmp_clisp-pjybmjki"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-lvmmubjx",
          "value": 2
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-yyomuyvg",
          "args": [
            "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
            "tmp_clisp-lvmmubjx"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-dxecyyuu",
          "args": [
            "threadResults",
            "tmp_clisp-yyomuyvg"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-vetzcttx",
          "args": [
            "tmp_clisp-dxecyyuu"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-qocafrpi",
          "args": [
            "alpha",
            "tmp_clisp-vetzcttx"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ifrzeyls",
          "value": 2
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-wcnyrcdy",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-cmoextcm",
          "args": [
            "tmp_clisp-wcnyrcdy",
            0,
            "tmp_clisp-ifrzeyls"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-nacsknev",
          "args": [
            "tmp_clisp-cmoextcm"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-rhifebbn",
          "args": [
            "beta",
            "tmp_clisp-nacsknev"
          ]
        },
        {
          "op": "fadd",
          "type": "float",
          "dest": "tmp_clisp-yynwbrba",
          "args": [
            "tmp_clisp-qocafrpi",
            "tmp_clisp-rhifebbn"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-gkceoknv",
            "tmp_clisp-yynwbrba"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-hfqlgcqu",
          "value": 3
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-jkdegtmk",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-yrhdebrs",
          "args": [
            "tmp_clisp-jkdegtmk",
            0,
            "tmp_clisp-hfqlgcqu"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-dxyqgskq",
          "value": 3
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-dtaypemg",
          "args": [
            "i.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
            "tmp_clisp-dxyqgskq"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-jfyfrgfv",
          "args": [
            "threadResults",
            "tmp_clisp-dtaypemg"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-havkkgjm",
          "args": [
            "tmp_clisp-jfyfrgfv"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-oqigvkbz",
          "args": [
            "alpha",
            "tmp_clisp-havkkgjm"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-degyplye",
          "value": 3
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-nljcwxpq",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-jxewgnes",
          "args": [
            "tmp_clisp-nljcwxpq",
            0,
            "tmp_clisp-degyplye"
          ]
        },
        {
          "op": "load",
          "type": "float",
          "dest": "tmp_clisp-ofqdihyl",
          "args": [
            "tmp_clisp-jxewgnes"
          ]
        },
        {
          "op": "fmul",
          "type": "float",
          "dest": "tmp_clisp-sgsdrrxc",
          "args": [
            "beta",
            "tmp_clisp-ofqdihyl"
          ]
        },
        {
          "op": "fadd",
          "type": "float",
          "dest": "tmp_clisp-fjyajvmy",
          "args": [
            "tmp_clisp-oqigvkbz",
            "tmp_clisp-sgsdrrxc"
          ]
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-yrhdebrs",
            "tmp_clisp-fjyajvmy"
          ]
        },
        {
          "op": "const",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "res.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
          "value": null
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ufsijtao",
          "value": 0
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-ufsijtao"
          ]
        },
        {
          "label": "tmp_clisp.loop-wldamqqu"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-asptiaki",
          "value": 4
        },
        {
          "op": "lt",
          "type": "bool",
          "dest": "tmp_clisp-lxwwicke",
          "args": [
            "idx",
            "tmp_clisp-asptiaki"
          ]
        },
        {
          "op": "br",
          "args": [
            "tmp_clisp-lxwwicke"
          ],
          "labels": [
            "tmp_clisp.cont-okzfwabe",
            "tmp_clisp.break-xnhcvron"
          ]
        },
        {
          "label": "tmp_clisp.cont-okzfwabe"
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-ptngmxkp",
          "args": [
            "res.vheynmha.rsrmyppv.tldyvvun.vbgjyhod"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-hcuyxhqh",
          "args": [
            "tmp_clisp-ptngmxkp",
            0,
            "idx"
          ]
        },
        {
          "op": "const",
          "type": "float",
          "dest": "tmp_clisp-gjcfehdo",
          "value": 0.0
        },
        {
          "op": "store",
          "args": [
            "tmp_clisp-hcuyxhqh",
            "tmp_clisp-gjcfehdo"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-sfcgquhj",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-vkylazjd",
          "args": [
            "idx",
            "tmp_clisp-sfcgquhj"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "idx",
          "args": [
            "tmp_clisp-vkylazjd"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-wldamqqu"
          ]
        },
        {
          "label": "tmp_clisp.break-xnhcvron"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-rysiihlu",
          "value": 0
        },
        {
          "op": "ptr-to",
          "type": {
            "ptr": {
              "arr": "float",
              "size": 4
            }
          },
          "dest": "tmp_clisp-gjabgeom",
          "args": [
            "res.vheynmha.rsrmyppv.tldyvvun.vbgjyhod"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-dorgzyjr",
          "args": [
            "tmp_clisp-gjabgeom",
            0,
            "tmp_clisp-rysiihlu"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-vwuldnjy",
          "args": [
            "tmp_clisp-dorgzyjr",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-xnwuviat",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-jiutuqyj",
          "args": [
            "threadRowInWarp",
            "tmp_clisp-xnwuviat"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ifewxvpv",
          "args": [
            "tmp_clisp-jiutuqyj",
            "resIdxM.vheynmha.rsrmyppv"
          ]
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-pnxjneos",
          "args": [
            "tmp_clisp-ifewxvpv",
            "N"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-akliqwii",
          "value": 8
        },
        {
          "op": "mul",
          "type": "int",
          "dest": "tmp_clisp-vycpwxpb",
          "args": [
            "threadColInWarp",
            "tmp_clisp-akliqwii"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-fjeiyqcl",
          "args": [
            "tmp_clisp-vycpwxpb",
            "resIdxN.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-yqqjerxl",
          "args": [
            "tmp_clisp-pnxjneos",
            "tmp_clisp-fjeiyqcl"
          ]
        },
        {
          "op": "ptradd",
          "type": {
            "ptr": "float"
          },
          "dest": "tmp_clisp-nrtxtxhs",
          "args": [
            "C_interim",
            "tmp_clisp-yqqjerxl"
          ]
        },
        {
          "op": "bitcast",
          "type": {
            "ptr": "int8"
          },
          "dest": "tmp_clisp-lxvikdlq",
          "args": [
            "tmp_clisp-nrtxtxhs",
            [
              "ptr",
              "int8"
            ]
          ]
        },
        {
          "op": "call",
          "type": "void",
          "dest": "tmp_clisp-puxoqrpj",
          "funcs": [
            "memcpy4"
          ],
          "args": [
            "tmp_clisp-vwuldnjy",
            "tmp_clisp-lxvikdlq"
          ]
        },
        {
          "op": "id",
          "type": {
            "arr": "float",
            "size": 4
          },
          "dest": "res.vheynmha.rsrmyppv.tldyvvun.vbgjyhod",
          "args": [
            "tmp.vheynmha.rsrmyppv.tldyvvun"
          ]
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-wkkxyaik",
          "value": 4
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-nngpgxtv",
          "args": [
            "resIdxN.vheynmha.rsrmyppv.tldyvvun",
            "tmp_clisp-wkkxyaik"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxN.vheynmha.rsrmyppv.tldyvvun",
          "args": [
            "tmp_clisp-nngpgxtv"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-ujiylyew"
          ]
        },
        {
          "label": "tmp_clisp.break-ihntwsrr"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-nyfebgfy",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-ehvryzrx",
          "args": [
            "resIdxM.vheynmha.rsrmyppv",
            "tmp_clisp-nyfebgfy"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "resIdxM.vheynmha.rsrmyppv",
          "args": [
            "tmp_clisp-ehvryzrx"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-hkqcyuvd"
          ]
        },
        {
          "label": "tmp_clisp.break-tgnxwkbc"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-iciexqrz",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-wkzzgfqf",
          "args": [
            "wSubColIdx",
            "tmp_clisp-iciexqrz"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubColIdx",
          "args": [
            "tmp_clisp-wkzzgfqf"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-dqfjchwq"
          ]
        },
        {
          "label": "tmp_clisp.break-bpngaigi"
        },
        {
          "op": "const",
          "type": "int",
          "dest": "tmp_clisp-ymmxtpwf",
          "value": 1
        },
        {
          "op": "add",
          "type": "int",
          "dest": "tmp_clisp-xxfdiqpv",
          "args": [
            "wSubRowIdx",
            "tmp_clisp-ymmxtpwf"
          ]
        },
        {
          "op": "id",
          "type": "int",
          "dest": "wSubRowIdx",
          "args": [
            "tmp_clisp-xxfdiqpv"
          ]
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.loop-tmaefhiu"
          ]
        },
        {
          "label": "tmp_clisp.break-rysknbac"
        },
        {
          "op": "jmp",
          "labels": [
            "tmp_clisp.ret_lbl-piuzfbqp"
          ]
        },
        {
          "label": "tmp_clisp.ret_lbl-piuzfbqp"
        },
        {
          "op": "ret",
          "args": []
        }
      ]
    }
  ],
  "strings": [],
  "structs": [],
  "globals": [
    {
      "name": "As",
      "type": {
        "arr": "float",
        "size": 8192
      },
      "init": [
        "addrspace",
        3
      ]
    },
    {
      "name": "Bs",
      "type": {
        "arr": "float",
        "size": 8192
      },
      "init": [
        "addrspace",
        3
      ]
    }
  ]
}
