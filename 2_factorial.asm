.data
fact: .asciiz "Ingrese un numero para calcular su factorial:\n"

.text
.globl main
main:
  li                $v0, 4
  la                $a0, fact
  syscall                           #imprime "Ingrese el numero....:"
  
  li                $v0, 5        
  syscall                           #read int
  
  move              $t0, $v0
  addi              $t1, $t0, -1    #se le resta 1 al numero ingresado
    
  loop:
  beq               $t1, $zero, exit   #cuando t1 valga 0, debe salir  del loop
  mul               $t0, $t0, $t1
  addi              $t1, $t1, -1       #decrementa
  j  loop

  exit:
  li                    $v0, 1
  move                  $a0, $t0
  syscall
  li                    $v0, 10
  syscall
