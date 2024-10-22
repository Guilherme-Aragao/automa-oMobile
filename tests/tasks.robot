*** Settings ***
Documentation            Suite de testes do cadastro de tarefas 

Resource        ${EXECDIR}/resources/base.resource


Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefas

    ${task}        Set Variable     Estudar Python 
    Removendo task from database    ${task}

    Do login



    Create a new task    ${task}
    Should have task     ${task}

    Sleep        5

Deve poder remover uma tarefa indesejada
    [Tags]    remove

    # Dado que eu tenho uma tarefa indesedejada
    ${task}        Set Variable     Comprar refrigerante
    Removendo task from database    ${task}
    
    # E essa foi cadastrada no sistema
    Do login
    Create a new task    ${task}
    Should have task     ${task}
    # Quando eu faço a exlusão dessa tarefa
    Remove task by name    ${task}

    # Então essa tarefa some da tela
    Wait Until Page Does Not Contain    ${task}

Deve poder concluir uma tarefa
    [Tags]    done

    ${task}        Set Variable     Estudar Xpath
    Removendo task from database    ${task}
    
    Do login
    Create a new task    ${task}
    Should have task     ${task}
    
    Finish task                ${task}
    Task should be done        ${task}