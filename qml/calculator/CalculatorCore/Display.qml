/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

BorderImage {
    id: image

    property alias text : displayText.text
    property alias currentOperation : operationText

    source: "images/display.png"
    border { left: 10; top: 10; right: 10; bottom: 10 }

    Text {
        id: displayText
        anchors {
            right: parent.right; verticalCenter: parent.verticalCenter; verticalCenterOffset: -1
            rightMargin: 6; left: operationText.right
        }
        font.pixelSize: parent.height * .6; text: "0"; horizontalAlignment: Text.AlignRight; elide: Text.ElideRight
        color: "#00d2ff"; smooth: true; font.bold: true
    }
    Text {
        id: operationText
        font.bold: true; font.pixelSize: parent.height * .7
        color: "#00d2ff"; smooth: true
        anchors { left: parent.left; leftMargin: 6; verticalCenterOffset: -3; verticalCenter: parent.verticalCenter }
    }
}
